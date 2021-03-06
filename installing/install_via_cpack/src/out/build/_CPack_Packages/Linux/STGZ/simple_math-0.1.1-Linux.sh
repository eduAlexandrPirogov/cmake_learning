#!/bin/sh

# Display usage
cpack_usage()
{
  cat <<EOF
Usage: $0 [options]
Options: [defaults in brackets after descriptions]
  --help            print this message
  --version         print cmake installer version
  --prefix=dir      directory in which to install
  --include-subdir  include the simple_math-0.1.1-Linux subdirectory
  --exclude-subdir  exclude the simple_math-0.1.1-Linux subdirectory
  --skip-license    accept license
EOF
  exit 1
}

cpack_echo_exit()
{
  echo $1
  exit 1
}

# Display version
cpack_version()
{
  echo "simple_math Installer Version: 0.1.1, Copyright (c) Humanity"
}

# Helper function to fix windows paths.
cpack_fix_slashes ()
{
  echo "$1" | sed 's/\\/\//g'
}

interactive=TRUE
cpack_skip_license=FALSE
cpack_include_subdir=""
for a in "$@"; do
  if echo $a | grep "^--prefix=" > /dev/null 2> /dev/null; then
    cpack_prefix_dir=`echo $a | sed "s/^--prefix=//"`
    cpack_prefix_dir=`cpack_fix_slashes "${cpack_prefix_dir}"`
  fi
  if echo $a | grep "^--help" > /dev/null 2> /dev/null; then
    cpack_usage
  fi
  if echo $a | grep "^--version" > /dev/null 2> /dev/null; then
    cpack_version
    exit 2
  fi
  if echo $a | grep "^--include-subdir" > /dev/null 2> /dev/null; then
    cpack_include_subdir=TRUE
  fi
  if echo $a | grep "^--exclude-subdir" > /dev/null 2> /dev/null; then
    cpack_include_subdir=FALSE
  fi
  if echo $a | grep "^--skip-license" > /dev/null 2> /dev/null; then
    cpack_skip_license=TRUE
  fi
done

if [ "x${cpack_include_subdir}x" != "xx" -o "x${cpack_skip_license}x" = "xTRUEx" ]
then
  interactive=FALSE
fi

cpack_version
echo "This is a self-extracting archive."
toplevel="`pwd`"
if [ "x${cpack_prefix_dir}x" != "xx" ]
then
  toplevel="${cpack_prefix_dir}"
fi

echo "The archive will be extracted to: ${toplevel}"

if [ "x${interactive}x" = "xTRUEx" ]
then
  echo ""
  echo "If you want to stop extracting, please press <ctrl-C>."

  if [ "x${cpack_skip_license}x" != "xTRUEx" ]
  then
    more << '____cpack__here_doc____'
LICENSE
=======

This is an installer created using CPack (https://cmake.org). No license provided.


____cpack__here_doc____
    echo
    while true
      do
        echo "Do you accept the license? [yn]: "
        read line leftover
        case ${line} in
          y* | Y*)
            cpack_license_accepted=TRUE
            break;;
          n* | N* | q* | Q* | e* | E*)
            echo "License not accepted. Exiting ..."
            exit 1;;
        esac
      done
  fi

  if [ "x${cpack_include_subdir}x" = "xx" ]
  then
    echo "By default the simple_math will be installed in:"
    echo "  \"${toplevel}/simple_math-0.1.1-Linux\""
    echo "Do you want to include the subdirectory simple_math-0.1.1-Linux?"
    echo "Saying no will install in: \"${toplevel}\" [Yn]: "
    read line leftover
    cpack_include_subdir=TRUE
    case ${line} in
      n* | N*)
        cpack_include_subdir=FALSE
    esac
  fi
fi

if [ "x${cpack_include_subdir}x" = "xTRUEx" ]
then
  toplevel="${toplevel}/simple_math-0.1.1-Linux"
  mkdir -p "${toplevel}"
fi
echo
echo "Using target directory: ${toplevel}"
echo "Extracting, please wait..."
echo ""

# take the archive portion of this file and pipe it to tar
# the NUMERIC parameter in this command should be one more
# than the number of lines in this header file
# there are tails which don't understand the "-n" argument, e.g. on SunOS
# OTOH there are tails which complain when not using the "-n" argument (e.g. GNU)
# so at first try to tail some file to see if tail fails if used with "-n"
# if so, don't use "-n"
use_new_tail_syntax="-n"
tail $use_new_tail_syntax +1 "$0" > /dev/null 2> /dev/null || use_new_tail_syntax=""

extractor="pax -r"
command -v pax > /dev/null 2> /dev/null || extractor="tar xf -"

tail $use_new_tail_syntax +155 "$0" | gunzip | (cd "${toplevel}" && ${extractor}) || cpack_echo_exit "Problem unpacking the simple_math-0.1.1-Linux"

echo "Unpacking finished successfully"

exit 0
#-----------------------------------------------------------
#      Start of TAR.GZ file
#-----------------------------------------------------------;
� ���b �\}l��=;���pH�>�������p�}�]e'Gl�A�{�W����MIq��H��J��P*�(*�RTUTbJ�BE� U4U�h@��T�W������(NA�_�y���{o�v<��f�\2SN�[����wv���:��fj�C��`GGg��B:�/d��*�(�TY�̓�\���@a����1qla|@{t�B�����H���C���_��X���W��hV��s���%JN�2�ҵ�F��GIb��%��R�X($�܂��c��w����� ����-d��� >h��;��N�\��ڂAw���7ҿ�#_Cn"����|��wUu¤�,��דu��ZS>���Xi��G�k��y�^F�T0��y�n�R��-2�<��X�YO��cr��.X�Y��M�E��Vz������y��>����J�+�jֲ����)>KHy�1���}�J��O����/��j}�G�����[@���?�{w2N�p�c�؍�%�jͤZ2J�<�2����Ky1h�����mۇi�MSv�gR���_��i��S�������CŇ��7<���R��-�<���!I��R_�<����x���Շ{���p����� �� �A~�����g#��9��w�?��l�?�ki&�0+v�$�f�9����$)64 �����RR�š��L>�����f�r۠�)��@ 9&%�(+j)��Dv��-!����/�Ŵ��%���`�����L)�hwj��/I�5���/��Nޫ��P2_V���qYڭ��r7D��d���J�e�����H,���Mt wP6��m�m�ݵKjC��۪�A�_������	ڿZ��wo��8Q7~��>5�����!�>�?{�{u��ł.+7+��ӱ������+t:��7��4��GX���U���uJ�A���I.��'Mr�<6c�כ�gL��|�$_l������E&����6�#O��5&��In�;��I���p�.>�xg��G���ݿ�ϭ�D�9�z*ǣ{��^i��oW�������[��O�Z�Tj���/�G�3���)�`mX�֧��*����Ws�R3�Gl��/G�^���ۙ�P$0x1z�������	yw��|�}Z}@��������\?�����"�U_\9�|�$��<���4M<��%�F��D�{���s�5Q�X���*0�(3�P9�[+���Mv���X˛��{�o�թSjct���̜>[�̤�q�-z�	w��E��]�Ho�A�Y��<J��3߅���AU�ާ~3�W����3O�5q������Tyv����o왭T�`A��ת��5`_o��/�n��p*�B��%
Y�hX}��8J���w��Uw������
�u�6֌��.\�p�..��*�ښ�Q���pٙJ������{�>�i�)���U���@���v��
�~q�!A��S�{�N"�{��������;W�}��O9�
�u��J%N˼[�5}a�Ew5L���o�|��g=�;\ӐB�
�S ����p��n���2���ޥu%(K�S�~�9�3�e��/���Ɯ��N�Cz�9}���.\�p���qgg��bo+�!��h�m~�26��a<ƽ��f'͌b��U�^彳�<�GX0�xͲ 0�Y;��1�m�cΚ]M���C,�c�F�}#��]���z��D����?�¡�uĚ���^?���2~�Wa<���,�_��/����{��c\>�qFG����׸���ߵÉrN-�1(�[ח5>��I汣�˿U�勵�Z� >&��!?�?��3\�|L�[a��1�'�i~�I��Z>�a���y@��������6�/�c�?�����=��b�oe�7�|3�<����ڭQ��V�]W�)������#Z4;������x��Z��[�A��5�!���^i|��}�YB㾽�q�n72�jǳ���o�|�g�1?"�(���;�;<�_<s5���7V'X��Xy�v8�`��c�����ɷ[�&o&�z��-L�����[t������?��a�)�<����8�����&�j@�I���ʣ%��{��$��|I�JI�_����4��'䌔R�Œ$��I2O���LS�9hм"�Ţ<!�sjq��.�ٴ�*g��b�$ȩZ���z1Y(h���]���i`C��߫JR�Rh\>p��$�RR*]R�����H��wl���rB����lͶ�ug�@D�l�'�mۇ�H�	�};�����=�^�̎�[#C�Pϖ�h�S�*)�J�RrR��Nq'��h�R^���3�}�(����X�!�b�?�	���X�q��*�h��A�s�~�R	��'8���U:�9��B�p4�>��#*�<,.�X�Ȫr�Z���)9�X b.����\Y,�tQ�0�e%�jQRLԳ%�B-mL.�15�:U�zʝ�b	F��� ����4#�+dTZ
�Uz+���M)�$" `��"�ڠ�c�	K��nC�t�WrVc�:�!����f7M|T�u0�Rq]�t�!p���zv����������6p���e������r��"\���+����L��{��2�������>�`���I�>(�z��Hǹ����D_��>�Ǒ�,���_'�Zy\�#��j�=dn��M���Y)�?���r=���0�3HGL�o���1��#sέ�>����9}��J�\~�x�c�~�k�����?��Oz�4|�_p��C�7`����q=�t)��o�_3}c��R>-GG���yW'����>+m��Ϗ�Sp-#���q�����۫��o��ܤ����{�>}Qg�7�3�V�zN��#�ןp�}���b�N���o���#��7��L��k���%+����_���!s����l�\�%d����X��!��t�>g��W8����i�9�o�n�*�����6��/���{O����q���CAS���_��m��_.��Q.&�nZ���?��o��0u?Gqku��2�|���Ьۂh��"���H��If�7�^�������Ưp8}��)�$q7�Q"ޘ��ܚ��^i��_z��#�(|,�C���<��͎\� ���M�+�/&��������������3�-v�V�������
��_G�W����>�v���������IF}���w�U�aF�89�O�i�B"�
j^�֓�+X��	FG��E����
���_���w<�2��C߅.>����k Z  