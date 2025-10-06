FROM ruby:3.1

# Instala dependencias del sistema
RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends nodejs

# Define el directorio de trabajo
WORKDIR /usr/src/app

# Copia solo Gemfile(s) primero, para aprovechar la cache
COPY Gemfile Gemfile.lock ./

# Instala gems
RUN bundle install

# Copia el resto del proyecto
COPY . .

# Comando por defecto
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
