import re,sys

"""
https://www.geeksforgeeks.org/dna-protein-python-3/
"""
dict = {
        'ATA':'I', 'ATC':'I', 'ATT':'I', 'ATG':'M',
        'ACA':'T', 'ACC':'T', 'ACG':'T', 'ACT':'T',
        'AAC':'N', 'AAT':'N', 'AAA':'K', 'AAG':'K',
        'AGC':'S', 'AGT':'S', 'AGA':'R', 'AGG':'R',
        'CTA':'L', 'CTC':'L', 'CTG':'L', 'CTT':'L',
        'CCA':'P', 'CCC':'P', 'CCG':'P', 'CCT':'P',
        'CAC':'H', 'CAT':'H', 'CAA':'Q', 'CAG':'Q',
        'CGA':'R', 'CGC':'R', 'CGG':'R', 'CGT':'R',
        'GTA':'V', 'GTC':'V', 'GTG':'V', 'GTT':'V',
        'GCA':'A', 'GCC':'A', 'GCG':'A', 'GCT':'A',
        'GAC':'D', 'GAT':'D', 'GAA':'E', 'GAG':'E',
        'GGA':'G', 'GGC':'G', 'GGG':'G', 'GGT':'G',
        'TCA':'S', 'TCC':'S', 'TCG':'S', 'TCT':'S',
        'TTC':'F', 'TTT':'F', 'TTA':'L', 'TTG':'L',
        'TAC':'Y', 'TAT':'Y', 'TAA':'*', 'TAG':'*',
        'TGC':'C', 'TGT':'C', 'TGA':'*', 'TGG':'W',
    }


def readfile(filename):
    """
    :param filename: A file contains DNA sequences
    :return: DNA sequences that has no space, number and other character except ATCG/atcg all in upper case.
    """

    with open(filename, 'r') as infile:
        seq = infile.read()

    s = re.sub('[^acgtACGT]', '', seq).upper()
    return s




def complement(str):
    """

    :param str: A cleaned DNA sequence.
    :return: A new DNA sequence that is complemented
    """
    conversionDict = {"A":'T', 'T':'A','C':'G','G':'C'}
    newstr = ''
    for l in str:
        if l in conversionDict:
            newstr += conversionDict[l]
        else:
            newstr += l
    return newstr



def readingFrame1(str,start):
    """

    :param str: DNA sequences that need to be read
    :param start: Position to start
    :return: A new protein
    """
    i = start
    newstr = ""
    while i < len(str):

        tmpstr = str[i:i + 3]
        if len(tmpstr) == 3:
            for d in dict:

                    if tmpstr == d:
                        newstr += dict[d]


        i += 3
    return newstr


def reversed(str):
  """
  :param str: DNA sequences
  :return: Reversed DNA sequences that used for 3'5'
  """

  return str[::-1]

def readingFrame2(str,start):
    """

    :param str: A reversed DNA sequence
    :param start: Position to start
    :return: A new protein
    """
    i = start
    newstr = ""
    while i < len(str):

        tmpstr = str[i:i + 3]

        if len(tmpstr) == 3:
            for d in dict:


                if tmpstr == d:
                    newstr += dict[d]


        i += 3
    return newstr

def write_frame(f1,f2,f3,f4,f5,f6):
    """

    :param f1: 5'3' Frame 1
    :param f2: 5'3' Frame 2
    :param f3: 5'3' Frame 3
    :param f4: 3'5' Frame 1
    :param f5: 3'5' Frame 2
    :param f6: 3'5' Frame 3
    :return: A txt file contains all 6 reading frames
    """

    file = open('output.txt', 'w')


    file.write(f1)
    file.write(f2)
    file.write(f3)
    file.write(f4)
    file.write(f5)
    file.write(f6)

    file.close()

def main():
    userinput = sys.argv[1]
    seq = readfile(userinput)
    f1 = "5'3' Frame 1" + "\n" + readingFrame1(seq, 0) + '\n' * 2
    f2 = "5'3' Frame 2" + "\n" + readingFrame1(seq, 1) + '\n' * 2
    f3 = "5'3' Frame 3" + "\n" + readingFrame1(seq, 2) + '\n' * 2

    comp = complement(seq)
    rev = reversed(comp)
    f4 = "3'5' Frame 1" + "\n" + readingFrame2(rev, 0) + '\n' * 2
    f5 = "3'5' Frame 2" + "\n" + readingFrame2(rev, 1) + '\n' * 2
    f6 = "3'5' Frame 3" + "\n" + readingFrame2(rev, 2) + '\n' * 2

    write_frame(f1, f2, f3, f4, f5, f6)


if __name__ == '__main__':
    main()