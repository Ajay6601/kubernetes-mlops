from setuptools import setup,find_packages

with open("requirements.txt") as f:
    requirements = f.read().splitlines()

setup(
    name="kubernetes-mlops",
    version="0.1",
    author="ajaysai",
    packages=find_packages(),
    install_requires = requirements,
)