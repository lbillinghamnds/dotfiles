# upgrade to latest pip whenever we make a new virtualenv like a postmkvirtualenv hook
upgrade_packages() {
    PYENV_VERSION=$VIRTUALENV_NAME pyenv-exec python -m pip install --upgrade pip
}
after_virtualenv 'upgrade_packages'
