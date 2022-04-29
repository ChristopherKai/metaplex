FROM rust:buster
USER root
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update && apt install nodejs yarn jq sudo -y && npm install -g typescript ts-node 
RUN mkdir -p /user/.local/share/solana
RUN sh -c "$(curl -sSfL https://release.solana.com/stable/install)"
ENV PATH="/root/.local/share/solana/install/active_release/bin/:$PATH"
# RUN solana-install update
# RUN git clone https://github.com/metaplex-foundation/metaplex.git /user/metaplex-foundation/metaplex
# RUN cd /user/metaplex-foundation/metaplex/js/packages/cli && yarn install && yarn bootstrap && yarn build && sed -i.backup -e 's/--no-bytecode//' package.json && yarn run package:linux
ENV PATH="/user/metaplex-foundation/metaplex/js/packages/cli/bin/linux/:$PATH"
RUN solana config set --url https://api.devnet.solana.com
RUN git clone https://github.com/exiled-apes/candy-machine-mint.git /user/candy-machine-mint
RUN cd /user/candy-machine-mint && yarn install && yarn build && npm install -g typescript ts-node
# v1
RUN git clone --branch v1.0.0 https://github.com/metaplex-foundation/metaplex.git ~/metaplex-foundation/metaplex && yarn install --cwd ~/metaplex-foundation/metaplex/js/
# v2
RUN git clone https://github.com/metaplex-foundation/metaplex.git ~/metaplex && yarn install --cwd ~/metaplex/js/


RUN mkdir -p /user/workdir
