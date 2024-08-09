import os
import glob
from tkinter import Tk, filedialog, messagebox

def select_directory(title):
    root = Tk()
    root.withdraw()  # Hide the root window
    directory = filedialog.askdirectory(title=title)
    root.destroy()
    if not directory:
        messagebox.showerror("Error", "No directory selected!")
        raise SystemExit("No directory selected, exiting script.")
    return directory

def process_files(input_dir, output_dir):
    # Find all relevant files in the input directory
    search_path = os.path.join(input_dir, '*/*_')
    files = glob.glob(search_path)

    for file_path in files:
        file_parts = file_path.split(os.sep)
        directory = file_parts[-2]

        # Create directory if it doesn't exist
        output_subdir = os.path.join(output_dir, directory)
        if not os.path.exists(output_subdir):
            os.mkdir(output_subdir)

        # Prepare the output file name
        file_name_parts = file_parts[-1].split('.')
        output_file_name = file_name_parts[0] + '.csv'

        output_file_path = os.path.join(output_subdir, output_file_name)

        # Command to convert the file using sbf2ismr
        command = f"sbf2ismr -f {file_path} -r {output_file_path}"
        os.system(command)

if __name__ == "__main__":
    # Select the input directory
    input_dir = select_directory("Select Input Directory")
    
    # Select the output directory
    output_dir = select_directory("Select Output Directory")
    
    # Process the files
    process_files(input_dir, output_dir)
    
    messagebox.showinfo("Info", "Processing complete!")
