Received: from adige.pair.com (adige.pair.com [209.68.5.114])
 by mx.groups.io with SMTP id smtpd.web10.25016.1586987381271758940
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Apr 2020 14:49:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 209.68.5.114, mailfrom: bluelightning@bluelightning.org)
Received: from adige.pair.com (localhost [127.0.0.1])
	by adige.pair.com (Postfix) with ESMTP id 95589959CA
	for <docs@lists.yoctoproject.org>; Wed, 15 Apr 2020 17:49:40 -0400 (EDT)
Received: from linc.fritz.box (unknown [IPv6:2406:e003:130a:e501:bc33:44c8:4f44:4e95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by adige.pair.com (Postfix) with ESMTPSA id DD0DB959E2
	for <docs@lists.yoctoproject.org>; Wed, 15 Apr 2020 17:49:39 -0400 (EDT)
From: "Paul Eggleton" <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH 2/2] ref-manual: add migration section for 3.1
Date: Thu, 16 Apr 2020 09:49:33 +1200
Message-Id: <387de38945c4514c58edf915474a2ec474539746.1586987359.git.bluelightning@bluelightning.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1586987359.git.bluelightning@bluelightning.org>
References: <cover.1586987359.git.bluelightning@bluelightning.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Paul Eggleton <paul.eggleton@microsoft.com>

Migration information for the 3.1 release.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/migration.xml | 201 +++++++++++++++++++++++++
 1 file changed, 201 insertions(+)

diff --git a/documentation/ref-manual/migration.xml b/documentation/ref-m=
anual/migration.xml
index 03efc7be2..9422b5a27 100644
--- a/documentation/ref-manual/migration.xml
+++ b/documentation/ref-manual/migration.xml
@@ -7095,6 +7095,207 @@ id=3Df4d4f99cfbc2396e49c1613a7d237b9e57f06f81'>co=
mmit message</ulink>.
     </section>
 </section>
=20
+
+<section id=3D'moving-to-the-yocto-project-3.1-release'>
+    <title>Moving to the Yocto Project 3.1 Release</title>
+
+    <para>
+        This section provides migration information for moving to the
+        Yocto Project 3.1 Release from the prior release.
+    </para>
+
+    <section id=3D'migration-3.1-minimum-system-requirements'>
+        <title>Minimum system requirements</title>
+
+        <para>
+            The following versions / requirements of build host componen=
ts have been updated:
+            <itemizedlist>
+                <listitem><para>gcc 5.0</para></listitem>
+                <listitem><para>python 3.5</para></listitem>
+                <listitem><para>tar 1.28</para></listitem>
+                <listitem><para><filename>rpcgen</filename> is now requi=
red on the host (part of the <filename>libc-dev-bin</filename> package on=
 Ubuntu, Debian and related distributions, and the <filename>glibc</filen=
ame> package on RPM-based distributions).</para></listitem>
+            </itemizedlist>
+           =20
+            Additionally, the <filename>makeinfo</filename> and <filenam=
e>pod2man</filename>
+            tools are <emphasis>no longer</emphasis> required on the hos=
t.
+        </para>
+    </section>
+
+    <section id=3D'migration-3.1-mpc8315e-rdb-removed'>
+        <title>mpc8315e-rdb machine removed</title>
+
+        <para>
+            The MPC8315E-RDB machine is old/obsolete and unobtainable, t=
hus given the maintenance burden
+            the <filename>mpc8315e-rdb</filename> machine configuration =
that supported it has been removed
+            in this release. The removal does leave a gap in official Po=
werPC reference hardware
+            support; this may change in future if a suitable machine wit=
h accompanying support resources
+            is found.
+        </para>
+    </section>
+   =20
+    <section id=3D'migration-3.1-python-2-removed'>
+        <title>Python 2 removed</title>
+
+        <para>
+            Due to the expiration of upstream support in January 2020, s=
upport for Python 2 has now been removed; it is recommended that you use =
Python 3 instead. If absolutely needed there is a meta-python2 community =
layer containing Python 2, related classes and various Python 2-based mod=
ules, however it should not be considered as supported.
+        </para>
+    </section>
+
+    <section id=3D'migration-3.1-reproducible-builds'>
+        <title>Reproducible builds now enabled by default</title>
+
+        <para>
+            In order to avoid unnecessary differences in output files (a=
iding binary reproducibility), the Poky distribution configuration (<file=
name><link linkend=3D'var-DISTRO'>DISTRO</link> =3D "poky"</filename>) no=
w inherits the <filename>reproducible_build</filename> class by default.
+        </para>
+    </section>
+   =20
+    <section id=3D'migration-3.1-ptest-feature-impact'>
+        <title>Impact of ptest feature is now more significant</title>
+
+        <para>
+            The Poky distribution configuration (<filename><link linkend=
=3D'var-DISTRO'>DISTRO</link> =3D "poky"</filename>) enables ptests by de=
fault to enable runtime testing of various components. In this release, a=
 dependency needed to be added that has resulted in a significant increas=
e in the number of components that will be built just when building a sim=
ple image such as core-image-minimal. If you do not need runtime tests en=
abled for core components, then it is recommended that you remove "ptest"=
 from <link linkend=3D'var-DISTRO_FEATURES'><filename>DISTRO_FEATURES</fi=
lename></link> to save a significant amount of build time e.g. by adding =
the following in your configuration:
+
+            <literallayout class=3D'monospaced'>
+      DISTRO_FEATURES_remove =3D "ptest"
+            </literallayout>
+        </para>
+    </section>
+
+    <section id=3D'migration-3.1-removed-recipes'>
+        <title>Removed recipes</title>
+
+        <para>
+            The following recipes have been removed:
+
+            <itemizedlist>
+                <listitem><para><filename>chkconfig</filename>: obsolete=
</para></listitem>
+                <listitem><para><filename>console-tools</filename>: obso=
lete</para></listitem>
+                <listitem><para><filename>enchant</filename>: replaced b=
y <filename>enchant2</filename></para></listitem>
+                <listitem><para><filename>foomatic-filters</filename>: o=
bsolete</para></listitem>
+                <listitem><para><filename>libidn</filename>: no longer n=
eeded, moved to meta-oe</para></listitem>
+                <listitem><para><filename>libmodulemd</filename>: replac=
ed by <filename>libmodulemd-v1</filename></para></listitem>
+                <listitem><para><filename>linux-yocto</filename>: drop 4=
.19, 5.2 version recipes (5.4 now provided)</para></listitem>
+                <listitem><para><filename>nspr</filename>: no longer nee=
ded, moved to meta-oe</para></listitem>
+                <listitem><para><filename>nss</filename>: no longer need=
ed, moved to meta-oe</para></listitem>
+                <listitem><para><filename>python</filename>: Python 2 re=
moved (Python 3 preferred)</para></listitem>
+                <listitem><para><filename>python-setuptools</filename>: =
Python 2 version removed (python3-setuptools preferred)</para></listitem>
+                <listitem><para><filename>sysprof</filename>: no longer =
needed, moved to meta-oe</para></listitem>
+                <listitem><para><filename>texi2html</filename>: obsolete=
</para></listitem>
+                <listitem><para><filename>u-boot-fw-utils</filename>: fu=
nctionally replaced by <filename>libubootenv</filename></para></listitem>
+            </itemizedlist>
+        </para>
+    </section>
+
+    <section id=3D'migration-3.1-features-check'>
+        <title>features_check class replaces distro_features_check</titl=
e>
+
+        <para>
+            The <filename>distro_features_check</filename> class has had=
 its functionality expanded, now supporting <filename>ANY_OF_MACHINE_FEAT=
URES</filename>, <filename>REQUIRED_MACHINE_FEATURES</filename>, <filenam=
e>CONFLICT_MACHINE_FEATURES</filename>, <filename>ANY_OF_COMBINED_FEATURE=
S</filename>, <filename>REQUIRED_COMBINED_FEATURES</filename>, <filename>=
CONFLICT_COMBINED_FEATURES</filename>. As a result the class has now been=
 renamed to <filename>features_check</filename>; the <filename>distro_fea=
tures_check</filename> class still exists but generates a warning and red=
irects to the new class. In preparation for a future removal of the old c=
lass it is recommended that you update recipes currently inheriting <file=
name>distro_features_check</filename> to inherit <filename>features_check=
</filename> instead.
+        </para>
+    </section>
+
+    <section id=3D'migration-3.1-removed-classes'>
+        <title>Removed classes</title>
+
+        <para>
+            The following classes have been removed:
+
+            <itemizedlist>
+                <listitem><para><filename>distutils-base</filename>: mov=
ed to meta-python2</para></listitem>
+                <listitem><para><filename>distutils</filename>: moved to=
 meta-python2</para></listitem>
+                <listitem><para><filename>libc-common</filename>: merged=
 into the glibc recipe as nothing else used it.</para></listitem>
+                <listitem><para><filename>python-dir</filename>: moved t=
o meta-python2</para></listitem>
+                <listitem><para><filename>pythonnative</filename>: moved=
 to meta-python2</para></listitem>
+                <listitem><para><filename>setuptools</filename>: moved t=
o meta-python2</para></listitem>
+                <listitem><para><filename>tinderclient</filename>: dropp=
ed as it was obsolete.</para></listitem>
+            </itemizedlist>
+        </para>
+    </section>
+
+    <section id=3D'migration-3.1-src-uri-checksums'>
+        <title>SRC_URI checksum behaviour</title>
+
+        <para>
+            Previously, recipes by tradition included both SHA256 and MD=
5 checksums for remotely fetched files in <link linkend=3D'var-SRC_URI'><=
filename>SRC_URI</filename></link>, even though only one is actually mand=
ated. However, the MD5 checksum does not add much given its inherent weak=
ness; thus when a checksum fails only the SHA256 sum will now be printed.=
 The md5sum will still be verified if it is specified.
+        </para>
+    </section>
+
+
+    <section id=3D'migration-3.1-npm'>
+        <title>npm fetcher changes</title>
+
+        <para>
+            The npm fetcher has been completely reworked in this release=
. The npm fetcher now only fetches the package source itself and no longe=
r the dependencies; there is now also an npmsw fetcher which explicitly f=
etches the shrinkwrap file and the dependencies. This removes the slightl=
y awkward <filename>NPM_LOCKDOWN</filename> and <filename>NPM_SHRINKWRAP<=
/filename> variables which pointed to local files; the lockdown file is n=
o longer needed at all. Additionally, the package name in <filename>npm:/=
/</filename> entries in <link linkend=3D'var-SRC_URI'><filename>SRC_URI</=
filename></link> is now specified using a <filename>package</filename> pa=
rameter instead of the earlier <filename>name</filename> which overlapped=
 with the generic <filename>name</filename> parameter. All recipes using =
the npm fetcher will need to be changed as a result.=20
+        </para>
+        <para>
+            An example of the new scheme:
+            <literallayout class=3D'monospaced'>
+SRC_URI =3D "npm://registry.npmjs.org;package=3Darray-flatten;version=3D=
1.1.1 \
+           npmsw://${THISDIR}/npm-shrinkwrap.json"
+            </literallayout>
+            Another example where the sources are fetched from git rathe=
r than an npm repository:
+            <literallayout class=3D'monospaced'>
+SRC_URI =3D "git://github.com/foo/bar.git;protocol=3Dhttps \
+           npmsw://${THISDIR}/npm-shrinkwrap.json"
+            </literallayout>
+        </para>
+        <para>
+            devtool and recipetool have also been updated to match with =
the npm fetcher changes. Other than producing working and more complete r=
ecipes for npm sources, there is also a minor change to the command line =
for devtool: the <filename>--fetch-dev</filename> option has been renamed=
 to <filename>--npm-dev</filename> as it is npm-specific.
+        </para>
+    </section>
+   =20
+   =20
+    <section id=3D'migration-3.1-packaging-changes'>
+        <title>Packaging changes</title>
+
+        <para>
+            <itemizedlist>
+                <listitem><para><filename>intltool</filename> has been r=
emoved from <filename>packagegroup-core-sdk</filename> as it is rarely ne=
eded to build modern software - gettext can do most of the things it used=
 to be needed for. <filename>intltool</filename> has also been removed fr=
om <filename>packagegroup-core-self-hosted</filename> as it is not needed=
 to for standard builds.</para></listitem>
+                <listitem><para>git: <filename>git-am</filename>, <filen=
ame>git-difftool</filename>, <filename>git-submodule</filename>, and <fil=
ename>git-request-pull</filename> are no longer perl-based, so are now in=
stalled with the main <filename>git</filename> package instead of within =
<filename>git-perltools</filename>.</para></listitem>
+                <listitem><para>The <filename>ldconfig</filename> binary=
 built as part of glibc has now been moved to its own <filename>ldconfig<=
/filename> package (note no <filename>glibc-</filename> prefix). This pac=
kage is in the <link linkend=3D'var-RRECOMMENDS'><filename>RRECOMMENDS</f=
ilename></link> of the main <filename>glibc</filename> package if <filena=
me>ldconfig</filename> is present in <link linkend=3D'var-DISTRO_FEATURES=
'><filename>DISTRO_FEATURES</filename></link>.</para></listitem>
+                <listitem><para><filename>libevent</filename> now splits=
 each shared library into its own package (as Debian does). Since these a=
re shared libraries and will be pulled in through the normal shared libra=
ry dependency handling, there should be no impact to existing configurati=
ons other than less unnecessary libraries being installed in some cases.<=
/para></listitem>
+                <listitem><para>linux-firmware now has a new package for=
 <filename>bcm4366c</filename> and includes available NVRAM config files =
into the <filename>bcm43340</filename>, <filename>bcm43362</filename>, <f=
ilename>bcm43430</filename> and <filename>bcm4356-pcie</filename> package=
s.</para></listitem>
+                <listitem><para><filename>harfbuzz</filename> now splits=
 the new <filename>libharfbuzz-subset.so</filename> library into its own =
package to reduce the main package size in cases where <filename>libharfb=
uzz-subset.so</filename> is not needed.</para></listitem>
+            </itemizedlist>
+        </para>
+    </section>
+   =20
+    <section id=3D'migration-3.1-package-qa-warnings'>
+        <title>Additional warnings</title>
+
+        <para>
+            Warnings will now be shown at <filename>do_package_qa</filen=
ame> time in the following circumstances:
+           =20
+            <itemizedlist>
+                <listitem><para>A recipe installs <filename>.desktop</fi=
lename> files containing <filename>MimeType</filename> keys but does not =
inherit the new <filename>mime-xdg</filename> class</para></listitem>
+                <listitem><para>A recipe installs <filename>.xml</filena=
me> files into <filename>${datadir}/mime/packages</filename> but does not=
 inherit the <filename>mime</filename> class</para></listitem>
+            </itemizedlist>
+        </para>
+    </section>
+       =20
+    <section id=3D'migration-3.1-x86-live-wic'>
+        <title><filename>wic</filename> image type now used instead of <=
filename>live</filename> by default for x86</title>
+
+        <para>
+            <filename>conf/machine/include/x86-base.inc</filename> (inhe=
rited by most x86 machine configurations) now specifies <filename>wic</fi=
lename> instead of <filename>live</filename> by default in <link linkend=3D=
'var-IMAGE_FSTYPES'><filename>IMAGE_FSTYPES</filename></link>. The <filen=
ame>live</filename> image type will likely be removed in a future release=
 so it is recommended that you use <filename>wic</filename> instead.
+        </para>
+    </section>
+               =20
+    <section id=3D'migration-3.1-misc'>
+        <title>Miscellaneous changes</title>
+
+        <para>
+            <itemizedlist>
+                <listitem><para>The undocumented <filename>SRC_DISTRIBUT=
E_LICENSES</filename> variable has now been removed in favour of a new <f=
ilename>AVAILABLE_LICENSES</filename> variable which is dynamically set b=
ased upon license files found in <filename>${COMMON_LICENSE_DIR}</filenam=
e> and <filename>${LICENSE_PATH}</filename>.</para></listitem>
+                <listitem><para>The tune definition for big-endian micro=
blaze machines is now <filename>microblaze</filename> instead of <filenam=
e>microblazeeb</filename>.</para></listitem>
+                <listitem><para><filename>newlib</filename> no longer ha=
s built-in syscalls. <filename>libgloss</filename> should then provide th=
e syscalls, <filename>crt0.o</filename> and other functions that are no l=
onger part of <filename>newlib</filename> itself. If you are using <filen=
ame>TCLIBC =3D "newlib"</filename> this now means that you must link appl=
ications with both <filename>newlib</filename> and <filename>libgloss</fi=
lename>, whereas before <filename>newlib</filename> would run in many con=
figurations by itself.</para></listitem>
+            </itemizedlist>
+        </para>
+    </section>
+
+</section>
+
+
 </chapter>
 <!--
 vim: expandtab tw=3D80 ts=3D4
--=20
2.20.1

