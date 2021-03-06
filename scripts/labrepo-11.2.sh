#!/usr/bin/bash
# This script creates and populates a local IPS repository
# for Solaris Hands-on Labs.
# This repository will contain only packages that are necessary 
# for the lab exercises, such as zone installation, AMP (Apache,
# MySQL, PHP) installation, iperf installation and ZFS shadow
# migration package.
#
# It's important that the list of packages below contains full FMRIs
# of the packages so there are no conflicts with the 'entire' package
# during zone installation.
#
# The list below was obtained the following way: install a zone
# the usual way, then run this command:
# zlogin zone1 pkg list -v | awk '{print $1}' > pkg-list-v
# and insert the contents of pkg-list-v file between PKGLIST labels.
#
# AMP packages as well as other necessary packages were added at the 
# end of this list. AMP packages list was obtained by issuing
# pkg install -v -n amp and editing the list manually.
#
#                          -- created by Pavel Anni 9/5/2014
#
zfs create -o mountpoint=/repo -o compress=on rpool/repo
pkgrepo create /repo
xargs pkgrecv -m latest -s http://pkg.oracle.com/solaris/release -d /repo << PKGLIST
pkg://solaris/compress/bzip2@1.0.6,5.11-0.175.2.0.0.42.1:20140623T010343Z
pkg://solaris/compress/gzip@1.5,5.11-0.175.2.0.0.42.1:20140623T010346Z
pkg://solaris/compress/p7zip@9.20.1,5.11-0.175.2.0.0.42.1:20140623T010348Z
pkg://solaris/compress/pbzip2@1.1.6,5.11-0.175.2.0.0.42.1:20140623T010357Z
pkg://solaris/compress/pixz@1.0,5.11-0.175.2.0.0.42.1:20140623T010358Z
pkg://solaris/compress/unzip@6.0,5.11-0.175.2.0.0.42.1:20140623T010359Z
pkg://solaris/compress/xz@5.0.1,5.11-0.175.2.0.0.42.1:20140623T010401Z
pkg://solaris/compress/zip@3.0,5.11-0.175.2.0.0.42.1:20140623T010404Z
pkg://solaris/consolidation/SunVTS/SunVTS-incorporation@7.18.1,5.11-0.175.2.0.0.42.4:20140623T214952Z
pkg://solaris/consolidation/X/X-incorporation@0.5.11,5.11-0.175.2.0.0.42.1406:20140623T215134Z
pkg://solaris/consolidation/admin/admin-incorporation@0.5.11,5.11-0.175.1.0.0.5.0:20111212T232623Z
pkg://solaris/consolidation/cacao/cacao-incorporation@0.5.11,5.11-0.175.2.0.0.38.0:20140428T130228Z
pkg://solaris/consolidation/cde/cde-incorporation@0.5.11,5.11-0.175.2.0.0.23.0:20130916T152657Z
pkg://solaris/consolidation/cns/cns-incorporation@0.5.11,5.11-0.175.2.0.0.39.0:20140512T125220Z
pkg://solaris/consolidation/dbtg/dbtg-incorporation@0.5.11,5.11-0.175.2.0.0.38.0:20140428T130044Z
pkg://solaris/consolidation/desktop/desktop-incorporation@0.5.11,5.11-0.175.2.0.0.42.0:20140623T125512Z
pkg://solaris/consolidation/desktop/gnome-incorporation@0.5.11,5.11-0.175.2.0.0.42.0:20140623T125514Z
pkg://solaris/consolidation/gfx/gfx-incorporation@0.5.11,5.11-0.175.1.0.0.5.0:20111212T232623Z
pkg://solaris/consolidation/install/install-incorporation@0.5.11,5.11-0.175.2.0.0.5.0:20130107T161003Z
pkg://solaris/consolidation/ips/ips-incorporation@0.5.11,5.11-0.175.2.0.0.41.0:20140609T232518Z
pkg://solaris/consolidation/java-7/java-7-incorporation@1.7.0.60.19,5.11-0:20140521T004349Z
pkg://solaris/consolidation/java-8/java-8-incorporation@1.8.0.5.13,5.11-0:20140409T155607Z
pkg://solaris/consolidation/java/java-incorporation@0.5.11,5.11-0.175.2.0.0.31.0:20140121T144341Z
pkg://solaris/consolidation/jdmk/jdmk-incorporation@0.5.11,5.11-0.175.2.0.0.22.0:20130902T173003Z
pkg://solaris/consolidation/l10n/l10n-incorporation@0.5.11,5.11-0.175.2.0.0.42.2:20140623T130256Z
pkg://solaris/consolidation/man/man-incorporation@0.5.11,5.11-0.175.2.0.0.40.0:20140527T142047Z
pkg://solaris/consolidation/nspg/nspg-incorporation@0.5.11,5.11-0.175.1.0.0.5.0:20111212T232623Z
pkg://solaris/consolidation/nvidia/nvidia-incorporation@0.5.11,5.11-0.175.2.0.0.35.0:20140317T135235Z
pkg://solaris/consolidation/osnet/osnet-incorporation@0.5.11,5.11-0.175.2.0.0.42.2:20140624T183842Z
pkg://solaris/consolidation/sfw/sfw-incorporation@0.5.11,5.11-0.175.1.0.0.5.0:20111212T232623Z
pkg://solaris/consolidation/sic_team/sic_team-incorporation@0.5.11,5.11-0.175.2.0.0.39.0:20140512T160329Z
pkg://solaris/consolidation/solaris_re/solaris_re-incorporation@0.5.11,5.11-0.175.2.0.0.42.0:20140623T214932Z
pkg://solaris/consolidation/ssm/ssm-incorporation@2.2.8,5.11-0.175.2.0.0.40.0:20140527T145302Z
pkg://solaris/consolidation/sunpro/sunpro-incorporation@0.5.11,5.11-0.175.2.0.0.37.0:20140414T130238Z
pkg://solaris/consolidation/ub_javavm-6/ub_javavm-6-incorporation@1.6.0.75,5.11-0:20140331T214534Z
pkg://solaris/consolidation/ub_javavm/ub_javavm-incorporation@0.5.11,5.11-0.175.2.0.0.31.0:20140121T144335Z
pkg://solaris/consolidation/userland/userland-incorporation@0.5.11,5.11-0.175.2.0.0.42.1:20140623T010405Z
pkg://solaris/consolidation/xvm/xvm-incorporation@0.5.11,5.11-0.175.1.0.0.5.0:20111212T232056Z
pkg://solaris/crypto/ca-certificates@0.5.11,5.11-0.175.2.0.0.42.2:20140624T183908Z
pkg://solaris/data/sgml-common@0.6.3,5.11-0.175.2.0.0.39.0:20140512T130023Z
pkg://solaris/database/berkeleydb-5@5.3.21,5.11-0.175.2.0.0.42.1:20140623T010417Z
pkg://solaris/database/sqlite-3@3.7.14.1,5.11-0.175.2.0.0.41.0:20140609T231843Z
pkg://solaris/desktop/xdg/xdg-utils@1.0.2,5.11-0.175.2.0.0.31.0:20140121T144643Z
pkg://solaris/developer/base-developer-utilities@0.5.11,5.11-0.175.2.0.0.42.2:20140624T183921Z
pkg://solaris/developer/build/pkg-config@0.23,5.11-0.175.2.0.0.42.1:20140623T011834Z
pkg://solaris/developer/debug/mdb@0.5.11,5.11-0.175.2.0.0.42.2:20140624T183936Z
pkg://solaris/developer/documentation-tool/openjade@1.3.2,5.11-0.175.2.0.0.24.0:20131001T134508Z
pkg://solaris/developer/documentation-tool/opensp@1.5.1,5.11-0.175.2.0.0.24.0:20131001T134513Z
pkg://solaris/developer/gnome/gettext@2.30.0,5.11-0.175.2.0.0.37.0:20140414T125414Z
pkg://solaris/developer/macro/cpp@0.5.11,5.11-0.175.2.0.0.6.0:20130122T182147Z
pkg://solaris/diagnostic/cpu-counters@0.5.11,5.11-0.175.2.0.0.42.2:20140624T184011Z
pkg://solaris/diagnostic/snoop@0.5.11,5.11-0.175.2.0.0.42.2:20140624T184027Z
pkg://solaris/diagnostic/tcpdump@4.5.1,5.11-0.175.2.0.0.42.1:20140623T013028Z
pkg://solaris/diagnostic/wireshark/tshark@1.10.7,5.11-0.175.2.0.0.42.1:20140623T013032Z
pkg://solaris/diagnostic/wireshark/wireshark-common@1.10.7,5.11-0.175.2.0.0.42.1:20140623T013033Z
pkg://solaris/editor/vim/vim-core@7.3.600,5.11-0.175.2.0.0.42.1:20140623T013525Z
pkg://solaris/entire@0.5.11,5.11-0.175.2.0.0.42.0:20140624T193832Z
pkg://solaris/file/gnu-coreutils@8.16,5.11-0.175.2.0.0.42.1:20140623T013554Z
pkg://solaris/gnome/config/gconf@2.31.1,5.11-0.175.2.0.0.24.0:20131001T134905Z
pkg://solaris/group/system/management/rad/rad-server-interfaces@0.5.11,5.11-0.175.2.0.0.42.2:20140624T184443Z
pkg://solaris/group/system/solaris-core-platform@0.5.11,5.11-0.175.2.0.0.42.2:20140624T184444Z
pkg://solaris/group/system/solaris-small-server@0.5.11,5.11-0.175.2.0.0.42.0:20140623T214939Z
pkg://solaris/image/library/libjpeg@6.0.2,5.11-0.175.0.0.0.0.0:20110927T095436Z
pkg://solaris/image/library/libpng@1.4.11,5.11-0.175.2.0.0.39.0:20140512T130109Z
pkg://solaris/image/library/libtiff@3.9.5,5.11-0.175.2.0.0.37.0:20140414T125753Z
pkg://solaris/install/archive@0.5.11,5.11-0.175.2.0.0.42.2:20140624T184445Z
pkg://solaris/install/distribution-constructor@0.5.11,5.11-0.175.2.0.0.42.2:20140624T184447Z
pkg://solaris/library/database/gdbm@1.8.3,5.11-0.175.2.0.0.42.1:20140623T013856Z
pkg://solaris/library/desktop/atk@1.30.0,5.11-0.175.2.0.0.27.0:20131111T152000Z
pkg://solaris/library/desktop/cairo@1.8.10,5.11-0.175.0.0.0.0.0:20110927T101648Z
pkg://solaris/library/desktop/gtk2@2.20.1,5.11-0.175.2.0.0.41.0:20140609T232038Z
pkg://solaris/library/desktop/pango@1.28.3,5.11-0.175.2.0.0.24.0:20131001T135623Z
pkg://solaris/library/expat@2.1.0,5.11-0.175.2.0.0.42.1:20140623T013857Z
pkg://solaris/library/glib2@2.28.6,5.11-0.175.2.0.0.33.0:20140217T134213Z
pkg://solaris/library/gmp@4.3.2,5.11-0.175.2.0.0.42.1:20140623T013905Z
pkg://solaris/library/gnome/gnome-component@2.24.3,5.11-0.175.2.0.0.31.0:20140121T144942Z
pkg://solaris/library/gnutls@2.8.6,5.11-0.175.2.0.0.42.0:20140623T125532Z
pkg://solaris/library/graphics/pixman@0.29.2,5.11-0.175.2.0.0.42.1406:20140623T215202Z
pkg://solaris/library/libarchive@3.0.4,5.11-0.175.2.0.0.42.1:20140623T014039Z
pkg://solaris/library/libffi@3.0.9,5.11-0.175.2.0.0.24.0:20131001T135907Z
pkg://solaris/library/libidn@1.19,5.11-0.175.2.0.0.42.1:20140623T014051Z
pkg://solaris/library/libmilter@8.14.7,5.11-0.175.2.0.0.42.2:20140624T184459Z
pkg://solaris/library/libsigsegv@2.6,5.11-0.175.2.0.0.42.1:20140623T014057Z
pkg://solaris/library/libtasn1@2.8,5.11-0.175.2.0.0.42.0:20140623T125542Z
pkg://solaris/library/libtecla@1.6.1,5.11-0.175.2.0.0.42.1:20140623T014102Z
pkg://solaris/library/libxml2@2.9.1,5.11-0.175.2.0.0.42.1:20140623T014110Z
pkg://solaris/library/libxslt@1.1.28,5.11-0.175.2.0.0.42.1:20140623T014116Z
pkg://solaris/library/ncurses@5.7,5.11-0.175.2.0.0.42.1:20140623T014124Z
pkg://solaris/library/nspr@4.9.5,5.11-0.175.2.0.0.39.0:20140512T160335Z
pkg://solaris/library/openldap@2.4.30,5.11-0.175.2.0.0.42.1:20140623T014203Z
pkg://solaris/library/pcre@8.21,5.11-0.175.2.0.0.42.1:20140623T014214Z
pkg://solaris/library/perl-5/openscap-512@1.0.0,5.11-0.175.2.0.0.42.1:20140623T014232Z
pkg://solaris/library/perl-5/sun-solaris-512@0.5.11,5.11-0.175.2.0.0.42.2:20140624T184501Z
pkg://solaris/library/perl-5/xml-parser@5.8.4,5.11-0.175.2.0.0.42.1:20140623T014307Z
pkg://solaris/library/perl-5/xml-parser-512@2.36,5.11-0.175.2.0.0.42.1:20140623T014302Z
pkg://solaris/library/popt@1.7,5.11-0.175.2.0.0.42.1:20140623T014329Z
pkg://solaris/library/python-2/cherrypy@3.1.2,5.11-0.175.2.0.0.42.1:20140623T014650Z
pkg://solaris/library/python-2/cherrypy-26@3.1.2,5.11-0.175.2.0.0.42.1:20140623T014646Z
pkg://solaris/library/python-2/jsonrpclib@0.1.3,5.11-0.175.2.0.0.42.1:20140623T014825Z
pkg://solaris/library/python-2/jsonrpclib-26@0.1.3,5.11-0.175.2.0.0.42.1:20140623T014822Z
pkg://solaris/library/python-2/libxml2-26@2.9.1,5.11-0.175.2.0.0.42.1:20140623T014847Z
pkg://solaris/library/python-2/libxsl-26@1.1.28,5.11-0.175.2.0.0.42.1:20140623T014851Z
pkg://solaris/library/python-2/locale-services@0.5.11,5.11-0.175.2.0.0.42.2:20140623T130350Z
pkg://solaris/library/python-2/lxml@2.3.3,5.11-0.175.2.0.0.42.1:20140623T014917Z
pkg://solaris/library/python-2/lxml-26@2.3.3,5.11-0.175.2.0.0.42.1:20140623T014905Z
pkg://solaris/library/python-2/m2crypto@0.21.1,5.11-0.175.2.0.0.42.1:20140623T014924Z
pkg://solaris/library/python-2/m2crypto-26@0.21.1,5.11-0.175.2.0.0.42.1:20140623T014918Z
pkg://solaris/library/python-2/mako@0.4.1,5.11-0.175.2.0.0.42.1:20140623T014928Z
pkg://solaris/library/python-2/mako-26@0.4.1,5.11-0.175.2.0.0.42.1:20140623T014925Z
pkg://solaris/library/python-2/openscap-26@1.0.0,5.11-0.175.2.0.0.42.1:20140623T014957Z
pkg://solaris/library/python-2/ordereddict@1.1,5.11-0.175.2.0.0.42.1:20140623T015001Z
pkg://solaris/library/python-2/ordereddict-26@1.1,5.11-0.175.2.0.0.42.1:20140623T015000Z
pkg://solaris/library/python-2/ply@3.1,5.11-0.175.2.0.0.42.1:20140623T015026Z
pkg://solaris/library/python-2/ply-26@3.1,5.11-0.175.2.0.0.42.1:20140623T015024Z
pkg://solaris/library/python-2/pybonjour@1.1.1,5.11-0.175.2.0.0.42.1:20140623T015044Z
pkg://solaris/library/python-2/pybonjour-26@1.1.1,5.11-0.175.2.0.0.42.1:20140623T015041Z
pkg://solaris/library/python-2/pycurl@7.19.0.1,5.11-0.175.2.0.0.42.1:20140623T015101Z
pkg://solaris/library/python-2/pycurl-26@7.19.0.1,5.11-0.175.2.0.0.42.1:20140623T015058Z
pkg://solaris/library/python-2/pyopenssl@0.13,5.11-0.175.2.0.0.42.1:20140623T015118Z
pkg://solaris/library/python-2/pyopenssl-26@0.13,5.11-0.175.2.0.0.42.1:20140623T015114Z
pkg://solaris/library/python-2/python-extra-26@2.6.4,5.11-0.175.2.0.0.27.0:20131111T152125Z
pkg://solaris/library/python-2/simplejson@2.1.2,5.11-0.175.2.0.0.42.1:20140623T015303Z
pkg://solaris/library/python-2/simplejson-26@2.1.2,5.11-0.175.2.0.0.42.1:20140623T015259Z
pkg://solaris/library/readline@5.2,5.11-0.175.2.0.0.42.1:20140623T015357Z
pkg://solaris/library/security/libgpg-error@1.12,5.11-0.175.2.0.0.33.0:20140217T134321Z
pkg://solaris/library/security/nss@4.14.3,5.11-0.175.2.0.0.39.0:20140512T160345Z
pkg://solaris/library/security/openssl@1.0.1.8,5.11-0.175.2.0.0.42.1:20140623T015422Z
pkg://solaris/library/security/trousers@0.3.6,5.11-0.175.2.0.0.42.1:20140623T015438Z
pkg://solaris/library/zlib@1.2.3,5.11-0.175.2.0.0.42.1:20140623T015457Z
pkg://solaris/media/cdrtools@3.1,5.11-0.175.2.0.0.42.1:20140623T015506Z
pkg://solaris/media/xorriso@0.6.0,5.11-0.175.2.0.0.42.1:20140623T015509Z
pkg://solaris/naming/ldap@0.5.11,5.11-0.175.2.0.0.42.2:20140624T184506Z
pkg://solaris/network/bridging@0.5.11,5.11-0.175.2.0.0.42.2:20140624T184508Z
pkg://solaris/network/dns/bind@9.6.3.11.0,5.11-0.175.2.0.0.42.1:20140623T015525Z
pkg://solaris/network/ipfilter@0.5.11,5.11-0.175.2.0.0.42.2:20140624T184514Z
pkg://solaris/network/open-fabrics@1.5.3,5.11-0.175.2.0.0.42.1:20140623T015538Z
pkg://solaris/network/ping@0.5.11,5.11-0.175.2.0.0.42.2:20140624T184525Z
pkg://solaris/network/rsync@3.1.0,5.11-0.175.2.0.0.42.1:20140623T015552Z
pkg://solaris/network/ssh@0.5.11,5.11-0.175.2.0.0.42.2:20140624T184529Z
pkg://solaris/network/ssh/ssh-key@0.5.11,5.11-0.175.2.0.0.42.2:20140624T184526Z
pkg://solaris/package/pkg@0.5.11,5.11-0.175.2.0.0.41.0:20140609T232532Z
pkg://solaris/package/pkg/zones-proxy@0.5.11,5.11-0.175.2.0.0.41.0:20140609T232531Z
pkg://solaris/package/svr4@0.5.11,5.11-0.175.2.0.0.42.2:20140624T184537Z
pkg://solaris/release/name@0.5.11,5.11-0.175.2.0.0.42.0:20140623T214940Z
pkg://solaris/release/notices@0.5.11,5.11-0.175.2.0.0.42.0:20140623T214942Z
pkg://solaris/runtime/lua@5.1.4,5.11-0.175.2.0.0.42.1:20140623T020143Z
pkg://solaris/runtime/perl-512@5.12.5,5.11-0.175.2.0.0.42.1:20140623T020146Z
pkg://solaris/runtime/python-26@2.6.8,5.11-0.175.2.0.0.42.1:20140623T020312Z
pkg://solaris/runtime/tcl-8@8.5.12,5.11-0.175.2.0.0.42.1:20140623T021306Z
pkg://solaris/security/compliance@0.5.11,5.11-0.175.2.0.0.42.2:20140624T184659Z
pkg://solaris/security/compliance/benchmark/pci-dss@0.5.11,5.11-0.175.2.0.0.42.2:20140624T184653Z
pkg://solaris/security/compliance/benchmark/solaris-policy@0.5.11,5.11-0.175.2.0.0.42.2:20140624T184654Z
pkg://solaris/security/compliance/openscap@1.0.0,5.11-0.175.2.0.0.42.1:20140623T021324Z
pkg://solaris/security/compliance/policy-tests@0.5.11,5.11-0.175.2.0.0.42.2:20140624T184655Z
pkg://solaris/security/nss-utilities@4.14.3,5.11-0.175.2.0.0.39.0:20140512T160401Z
pkg://solaris/security/sudo@1.8.6.7,5.11-0.175.2.0.0.42.1:20140623T021341Z
pkg://solaris/security/tcp-wrapper@7.6,5.11-0.175.2.0.0.42.2:20140624T184700Z
pkg://solaris/service/file-system/nfs@0.5.11,5.11-0.175.2.0.0.42.2:20140624T184703Z
pkg://solaris/service/gnome/desktop-cache@0.2.7,5.11-0.175.2.0.0.40.0:20140527T133420Z
pkg://solaris/service/network/dns/mdns@0.5.11,5.11-0.175.2.0.0.42.2:20140624T184719Z
pkg://solaris/service/network/smtp/sendmail@8.14.7,5.11-0.175.2.0.0.42.2:20140624T184739Z
pkg://solaris/service/network/ssh@0.5.11,5.11-0.175.2.0.0.42.2:20140624T184747Z
pkg://solaris/service/security/gss@0.5.11,5.11-0.175.2.0.0.42.2:20140624T184759Z
pkg://solaris/service/security/kerberos-5@0.5.11,5.11-0.175.2.0.0.42.2:20140624T184800Z
pkg://solaris/service/storage/media-volume-manager@0.5.11,5.11-0.173.0.0.0.1.0:20110826T161917Z
pkg://solaris/shell/bash@4.1.11,5.11-0.175.2.0.0.42.1:20140623T021558Z
pkg://solaris/shell/ksh93@93.21.0.20110208,5.11-0.175.2.0.0.42.1:20140623T021607Z
pkg://solaris/system/boot-environment-utilities@0.5.11,5.11-0.175.2.0.0.42.2:20140624T184924Z
pkg://solaris/system/boot/wanboot@0.5.11,5.11-0.175.2.0.0.42.2:20140624T184922Z
pkg://solaris/system/core-os@0.5.11,5.11-0.175.2.0.0.42.2:20140624T184927Z
pkg://solaris/system/data/terminfo/terminfo-core@0.5.11,5.11-0.175.2.0.0.42.2:20140624T185039Z
pkg://solaris/system/data/timezone@0.5.11,5.11-0.175.2.0.0.42.1:20140623T021645Z
pkg://solaris/system/device-administration@0.5.11,5.11-0.175.2.0.0.42.2:20140624T185053Z
pkg://solaris/system/dtrace@0.5.11,5.11-0.175.2.0.0.42.2:20140624T185114Z
pkg://solaris/system/dtrace/dtrace-toolkit@0.99,5.11-0.175.2.0.0.42.2:20140624T185101Z
pkg://solaris/system/extended-system-utilities@0.5.11,5.11-0.170:20110719T015321Z
pkg://solaris/system/fault-management@0.5.11,5.11-0.175.2.0.0.42.2:20140624T185142Z
pkg://solaris/system/fault-management/smtp-notify@0.5.11,5.11-0.175.2.0.0.42.2:20140624T185139Z
pkg://solaris/system/file-system/autofs@0.5.11,5.11-0.175.2.0.0.42.2:20140624T185204Z
pkg://solaris/system/file-system/hsfs@0.5.11,5.11-0.175.2.0.0.42.2:20140624T185207Z
pkg://solaris/system/file-system/nfs@0.5.11,5.11-0.175.2.0.0.42.2:20140624T185208Z
pkg://solaris/system/file-system/pcfs@0.5.11,5.11-0.175.2.0.0.42.2:20140624T185218Z
pkg://solaris/system/file-system/smb@0.5.11,5.11-0.175.2.0.0.42.2:20140624T185222Z
pkg://solaris/system/file-system/udfs@0.5.11,5.11-0.175.2.0.0.42.2:20140624T185232Z
pkg://solaris/system/file-system/ufs@0.5.11,5.11-0.175.2.0.0.42.2:20140624T185234Z
pkg://solaris/system/file-system/uvfs@0.5.11,5.11-0.175.2.0.0.42.2:20140624T185240Z
pkg://solaris/system/file-system/zfs@0.5.11,5.11-0.175.2.0.0.42.2:20140624T185242Z
pkg://solaris/system/firmware-utilities@0.5.11,5.11-0.175.2.0.0.42.2:20140624T185258Z
pkg://solaris/system/hal@0.5.11,5.11-0.175.2.0.0.42.2:20140624T185304Z
pkg://solaris/system/install@0.5.11,5.11-0.175.2.0.0.42.2:20140624T185350Z
pkg://solaris/system/install/auto-install/auto-install-common@0.5.11,5.11-0.175.2.0.0.42.2:20140624T185337Z
pkg://solaris/system/install/configuration@0.5.11,5.11-0.175.2.0.0.42.2:20140624T185342Z
pkg://solaris/system/install/locale@0.5.11,5.11-0.175.2.0.0.42.2:20140623T130840Z
pkg://solaris/system/kernel@0.5.11,5.11-0.175.2.0.0.42.2:20140624T185542Z
pkg://solaris/system/library@0.5.11,5.11-0.175.2.0.0.42.2:20140624T185750Z
pkg://solaris/system/library/boot-management@0.5.11,5.11-0.175.2.0.0.42.2:20140624T185700Z
pkg://solaris/system/library/c++-runtime@0.5.11,5.11-0.175.2.0.0.37.0:20140414T130401Z
pkg://solaris/system/library/dbus@1.7.1,5.11-0.175.2.0.0.40.0:20140527T133422Z
pkg://solaris/system/library/fontconfig@2.8.0,5.11-0.175.2.0.0.42.1406:20140623T215408Z
pkg://solaris/system/library/freetype-2@2.4.11,5.11-0.175.2.0.0.42.1406:20140623T215415Z
pkg://solaris/system/library/gcc-3-runtime@3.4.3,5.11-0.175.2.0.0.42.1:20140623T021739Z
pkg://solaris/system/library/iconv/unicode-core@0.5.11,5.11-0.175.2.0.0.42.2:20140623T131124Z
pkg://solaris/system/library/iconv/utf-8@0.5.11,5.11-0.175.2.0.0.42.2:20140623T131620Z
pkg://solaris/system/library/install@0.5.11,5.11-0.175.2.0.0.42.2:20140624T185703Z
pkg://solaris/system/library/install/libinstzones@0.5.11,5.11-0.175.2.0.0.42.2:20140624T185702Z
pkg://solaris/system/library/libdbus@1.7.1,5.11-0.175.2.0.0.40.0:20140527T133433Z
pkg://solaris/system/library/libdbus-glib@0.100,5.11-0.175.2.0.0.39.0:20140512T130320Z
pkg://solaris/system/library/libpcap@1.5.1,5.11-0.175.2.0.0.42.1:20140623T021812Z
pkg://solaris/system/library/libv12n@0.5.11,5.11-0.175.2.0.0.42.2:20140624T185707Z
pkg://solaris/system/library/math@0.5.11,5.11-0.175.2.0.0.37.0:20140414T130409Z
pkg://solaris/system/library/mmheap@0.5.11,5.11-0.175.2.0.0.23.0:20130916T153150Z
pkg://solaris/system/library/openmp@0.5.11,5.11-0.175.2.0.0.37.0:20140414T130412Z
pkg://solaris/system/library/security/gss@0.5.11,5.11-0.175.2.0.0.42.2:20140624T185718Z
pkg://solaris/system/library/security/gss/diffie-hellman@0.5.11,5.11-0.175.2.0.0.42.2:20140624T185714Z
pkg://solaris/system/library/security/gss/spnego@0.5.11,5.11-0.175.2.0.0.42.2:20140624T185716Z
pkg://solaris/system/library/security/libgcrypt@1.5.3,5.11-0.175.2.0.0.33.0:20140217T134516Z
pkg://solaris/system/library/security/libsasl@0.5.11,5.11-0.175.2.0.0.42.2:20140624T185721Z
pkg://solaris/system/library/security/rpcsec@0.5.11,5.11-0.175.2.0.0.42.2:20140624T185730Z
pkg://solaris/system/library/storage/libdiskmgt@0.5.11,5.11-0.175.2.0.0.42.2:20140624T185731Z
pkg://solaris/system/library/storage/scsi-plugins@0.5.11,5.11-0.175.2.0.0.42.2:20140624T185735Z
pkg://solaris/system/library/storage/snia-ima@0.5.11,5.11-0.175.2.0.0.42.2:20140624T185740Z
pkg://solaris/system/library/storage/suri@0.5.11,5.11-0.175.2.0.0.42.2:20140624T185745Z
pkg://solaris/system/linker@0.5.11,5.11-0.175.2.0.0.42.2:20140624T185945Z
pkg://solaris/system/locale@0.5.11,5.11-0.175.2.0.0.42.2:20140623T131828Z
pkg://solaris/system/management/rad@0.5.11,5.11-0.175.2.0.0.42.2:20140624T190031Z
pkg://solaris/system/management/rad/client/rad-c@0.5.11,5.11-0.175.2.0.0.42.2:20140624T190007Z
pkg://solaris/system/management/rad/client/rad-python@0.5.11,5.11-0.175.2.0.0.42.2:20140624T190015Z
pkg://solaris/system/management/rad/module/rad-dlmgr@0.5.11,5.11-0.175.2.0.0.42.2:20140624T190017Z
pkg://solaris/system/management/rad/module/rad-files@0.5.11,5.11-0.175.2.0.0.42.2:20140624T190019Z
pkg://solaris/system/management/rad/module/rad-kstat@0.5.11,5.11-0.175.2.0.0.42.2:20140624T190020Z
pkg://solaris/system/management/rad/module/rad-network@0.5.11,5.11-0.175.2.0.0.42.2:20140624T190021Z
pkg://solaris/system/management/rad/module/rad-panels@0.5.11,5.11-0.175.2.0.0.42.2:20140624T190022Z
pkg://solaris/system/management/rad/module/rad-smf@0.5.11,5.11-0.175.2.0.0.42.2:20140624T190024Z
pkg://solaris/system/management/rad/module/rad-time@0.5.11,5.11-0.175.2.0.0.42.2:20140624T190025Z
pkg://solaris/system/management/rad/module/rad-usermgr@0.5.11,5.11-0.175.2.0.0.42.2:20140624T190026Z
pkg://solaris/system/management/rad/module/rad-zonemgr@0.5.11,5.11-0.175.2.0.0.42.2:20140624T190028Z
pkg://solaris/system/manual@0.5.11,5.11-0.175.2.0.0.40.0:20140527T142048Z
pkg://solaris/system/manual/locale@0.5.11,5.11-0.175.2.0.0.42.2:20140623T133506Z
pkg://solaris/system/network@0.5.11,5.11-0.175.2.0.0.42.2:20140624T190110Z
pkg://solaris/system/network/ike@0.5.11,5.11-0.175.2.0.0.42.2:20140624T190041Z
pkg://solaris/system/network/nis@0.5.11,5.11-0.175.2.0.0.42.2:20140624T190057Z
pkg://solaris/system/network/routing@0.5.11,5.11-0.175.2.0.0.42.2:20140624T190108Z
pkg://solaris/system/prerequisite/gnu@0.5.11,5.11-0.175.2.0.0.42.1:20140623T021928Z
pkg://solaris/system/resource-mgmt/resource-caps@0.5.11,5.11-0.175.2.0.0.42.2:20140624T190123Z
pkg://solaris/system/resource-mgmt/resource-pools@0.5.11,5.11-0.175.2.0.0.42.2:20140624T190125Z
pkg://solaris/system/storage/iscsi/iscsi-initiator@0.5.11,5.11-0.175.2.0.0.42.2:20140624T190139Z
pkg://solaris/system/storage/media-volume-manager@0.5.11,5.11-0.175.2.0.0.42.2:20140624T190147Z
pkg://solaris/system/storage/removable-media@0.5.11,5.11-0.175.2.0.0.42.2:20140624T190154Z
pkg://solaris/system/system-events@0.5.11,5.11-0.175.2.0.0.42.2:20140624T190206Z
pkg://solaris/system/xopen/xcu4@0.5.11,5.11-0.175.2.0.0.42.2:20140624T190214Z
pkg://solaris/system/zones@0.5.11,5.11-0.175.2.0.0.42.2:20140624T190241Z
pkg://solaris/system/zones/brand/brand-solaris@0.5.11,5.11-0.175.2.0.0.42.2:20140624T190236Z
pkg://solaris/terminal/luit@1.1.1,5.11-0.175.2.0.0.42.1406:20140623T215420Z
pkg://solaris/terminal/resize@0.271,5.11-0.175.2.0.0.42.1406:20140623T215421Z
pkg://solaris/text/doctools@0.5.11,5.11-0.175.2.0.0.42.2:20140624T190250Z
pkg://solaris/text/doctools/ja@0.5.11,5.11-0.175.2.0.0.42.2:20140623T133548Z
pkg://solaris/text/gawk@3.1.8,5.11-0.175.2.0.0.42.1:20140623T021946Z
pkg://solaris/text/gnu-gettext@0.16.1,5.11-0.175.2.0.0.42.1:20140623T021950Z
pkg://solaris/text/groff/groff-core@1.19.2,5.11-0.175.2.0.0.42.1:20140623T022021Z
pkg://solaris/text/less@436,5.11-0.175.2.0.0.42.1:20140623T022038Z
pkg://solaris/text/spelling-utilities@0.5.11,5.11-0.175.2.0.0.42.2:20140624T190302Z
pkg://solaris/web/curl@7.21.2,5.11-0.175.2.0.0.42.1:20140623T022054Z
pkg://solaris/web/wget@1.14,5.11-0.175.2.0.0.42.1:20140623T022834Z
pkg://solaris/x11/header/x11-protocols@7.7,5.11-0.175.2.0.0.42.1406:20140623T215449Z
pkg://solaris/x11/library/libfontenc@1.1.2,5.11-0.175.2.0.0.42.1406:20140623T215506Z
pkg://solaris/x11/library/libpthread-stubs@0.3,5.11-0.175.2.0.0.42.1406:20140623T215512Z
pkg://solaris/x11/library/libx11@1.6.2,5.11-0.175.2.0.0.42.1406:20140623T215515Z
pkg://solaris/x11/library/libxau@1.0.8,5.11-0.175.2.0.0.42.1406:20140623T215531Z
pkg://solaris/x11/library/libxcb@1.9.1,5.11-0.175.2.0.0.42.1406:20140623T215532Z
pkg://solaris/x11/library/libxcomposite@0.4.4,5.11-0.175.2.0.0.42.1406:20140623T215546Z
pkg://solaris/x11/library/libxcursor@1.1.14,5.11-0.175.2.0.0.42.1406:20140623T215547Z
pkg://solaris/x11/library/libxdamage@1.1.4,5.11-0.175.2.0.0.42.1406:20140623T215548Z
pkg://solaris/x11/library/libxdmcp@1.1.1,5.11-0.175.2.0.0.42.1406:20140623T215550Z
pkg://solaris/x11/library/libxevie@1.0.3,5.11-0.175.2.0.0.42.1406:20140623T215551Z
pkg://solaris/x11/library/libxext@1.3.2,5.11-0.175.2.0.0.42.1406:20140623T215552Z
pkg://solaris/x11/library/libxfixes@5.0.1,5.11-0.175.2.0.0.42.1406:20140623T215555Z
pkg://solaris/x11/library/libxft@2.3.1,5.11-0.175.2.0.0.42.1406:20140623T215558Z
pkg://solaris/x11/library/libxi@1.7.2,5.11-0.175.2.0.0.42.1406:20140623T215559Z
pkg://solaris/x11/library/libxinerama@1.1.3,5.11-0.175.2.0.0.42.1406:20140623T215601Z
pkg://solaris/x11/library/libxrandr@1.4.2,5.11-0.175.2.0.0.42.1406:20140623T215610Z
pkg://solaris/x11/library/libxrender@0.9.8,5.11-0.175.2.0.0.42.1406:20140623T215611Z
pkg://solaris/x11/library/libxscrnsaver@1.2.2,5.11-0.175.2.0.0.42.1406:20140623T215613Z
pkg://solaris/database/mysql-55@5.5.31,5.11-0.175.2.0.0.42.1:20140623T011308Z
pkg://solaris/database/mysql-55/library@5.5.31,5.11-0.175.2.0.0.42.1:20140623T011152Z
pkg://solaris/database/mysql-common@5.11,5.11-0.175.2.0.0.42.1:20140623T011655Z
pkg://solaris/group/feature/amp@0.5.11,5.11-0.175.2.0.0.41.0:20140609T232520Z
pkg://solaris/library/apr-13@1.3.9,5.11-0.175.2.0.0.42.1:20140623T013802Z
pkg://solaris/library/apr-util-13@1.3.9,5.11-0.175.2.0.0.42.1:20140623T013812Z
pkg://solaris/library/apr-util-13/apr-ldap@1.3.9,5.11-0.175.2.0.0.42.1:20140623T013805Z
pkg://solaris/library/apr-util-13/dbd-mysql@1.3.9,5.11-0.175.2.0.0.42.1:20140623T013807Z
pkg://solaris/library/apr-util-13/dbd-sqlite@1.3.9,5.11-0.175.2.0.0.42.1:20140623T013808Z
pkg://solaris/library/libtool/libltdl@2.4.2,5.11-0.175.2.0.0.42.1:20140623T014104Z
pkg://solaris/library/python-2/net-snmp-26@5.4.1,5.11-0.175.2.0.0.42.1:20140623T014940Z
pkg://solaris/system/fault-management/fm-snmp-mib@0.5.11,5.11-0.175.2.0.0.42.2:20140624T185138Z
pkg://solaris/system/library/gcc/gcc-c++-runtime@4.8.2,5.11-0.175.2.0.0.42.1:20140623T021708Z
pkg://solaris/system/library/gcc/gcc-c-runtime@4.8.2,5.11-0.175.2.0.0.42.1:20140623T021719Z
pkg://solaris/system/library/security/libmcrypt@2.5.8,5.11-0.175.2.0.0.42.1:20140623T021814Z
pkg://solaris/system/management/snmp/net-snmp@5.4.1,5.11-0.175.2.0.0.42.1:20140623T021838Z
pkg://solaris/text/tidy@1.0.0,5.11-0.175.2.0.0.42.1:20140623T022043Z
pkg://solaris/web/php-53@5.3.28,5.11-0.175.2.0.0.42.1:20140623T022609Z
pkg://solaris/web/php-53/extension/php-apc@3.1.9,5.11-0.175.2.0.0.42.1:20140623T022556Z
pkg://solaris/web/php-53/extension/php-idn@0.2.0,5.11-0.175.2.0.0.42.1:20140623T022558Z
pkg://solaris/web/php-53/extension/php-memcache@3.0.6,5.11-0.175.2.0.0.42.1:20140623T022559Z
pkg://solaris/web/php-53/extension/php-mysql@5.3.28,5.11-0.175.2.0.0.42.1:20140623T022600Z
pkg://solaris/web/php-53/extension/php-pear@5.3.28,5.11-0.175.2.0.0.42.1:20140623T022602Z
pkg://solaris/web/php-53/extension/php-suhosin@0.9.33,5.11-0.175.2.0.0.42.1:20140623T022603Z
pkg://solaris/web/php-53/extension/php-tcpwrap@1.1.3,5.11-0.175.2.0.0.42.1:20140623T022605Z
pkg://solaris/web/php-53/extension/php-xdebug@2.2.0,5.11-0.175.2.0.0.42.1:20140623T022606Z
pkg://solaris/web/php-common@11.1,5.11-0.175.2.0.0.42.1:20140623T022643Z
pkg://solaris/web/server/apache-22@2.2.27,5.11-0.175.2.0.0.42.1:20140623T022811Z
pkg://solaris/web/server/apache-22/module/apache-dtrace@0.3.1,5.11-0.175.2.0.0.42.1:20140623T022727Z
pkg://solaris/web/server/apache-22/module/apache-fcgid@2.3.9,5.11-0.175.2.0.0.42.1:20140623T022730Z
pkg://solaris/web/server/apache-22/module/apache-php53@5.3.28,5.11-0.175.2.0.0.42.1:20140623T022750Z
pkg://solaris/x11/library/libice@1.0.8,5.11-0.175.2.0.0.42.1406:20140623T215510Z
pkg://solaris/x11/library/libsm@1.2.2,5.11-0.175.2.0.0.42.1406:20140623T215513Z
pkg://solaris/x11/library/libxpm@3.5.11,5.11-0.175.2.0.0.42.1406:20140623T215608Z
pkg://solaris/x11/library/toolkit/libxt@1.1.4,5.11-0.175.2.0.0.42.1406:20140623T215638Z
pkg://solaris/system/file-system/shadow-migration@0.5.11,5.11-0.175.2.0.0.42.2:20140624T185220Z
pkg://solaris/benchmark/iperf@2.0.4,5.11-0.175.2.0.0.42.1:20140623T010217Z
pkg://solaris/image/gnuplot@4.6.0,5.11-0.175.2.0.0.42.1:20140623T013633Z
pkg://solaris/library/gd@2.0.35,5.11-0.175.2.0.0.42.1:20140623T013902Z 
pkg://solaris/library/graphics/wxwidgets@2.8.12,5.11-0.175.2.0.0.42.1:20140623T013910Z 
pkg://solaris/library/sdl@1.2.14,5.11-0.175.2.0.0.39.0:20140512T130150Z
PKGLIST
pkgrepo rebuild -s /repo
svccfg -s application/pkg/server setprop pkg/inst_root=/repo
svcprop -p pkg/inst_root application/pkg/server
svcadm refresh application/pkg/server
svcadm enable application/pkg/server
#pkg set-publisher -G '*' -M '*' -g http://10.0.2.15/ solaris
