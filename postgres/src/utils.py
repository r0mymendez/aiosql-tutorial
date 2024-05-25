import yaml

class Utils:
    @staticmethod
    def read_yaml(file_path):
        with open(file_path, 'r') as file:
            return yaml.safe_load(file)
    
    @staticmethod
    def read_file(file_path):
        with open(file_path, 'r') as file:
            return file.read()