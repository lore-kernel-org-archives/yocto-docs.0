Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web10.224.1586990368587206413
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Apr 2020 15:39:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fZa/SQ+L;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id n16so646015pgb.7
        for <docs@lists.yoctoproject.org>; Wed, 15 Apr 2020 15:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:cc:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=VkZY6ivpKX83X0G3u+jmfvPQOW36EKG9dRiUi92r6YE=;
        b=fZa/SQ+LGrAq6TOIq/wWPveUN/Sr+gKC9sHYpUtOxLedzkONiZ6zawfv1DrMFoLkys
         3cTqs+0z6gdDDemk2/oXX/Qd2BAgP6aUH05kPlx4XMIq8E8UsFgtn6TPmEzSCSzbWV45
         rjWDzY42a3clI1h0Do2GAoSscWkdaHzp7KmKMGNmhjM86RNNCJQmb7aApqtN8/b+oMBd
         I3L8biTziKFXxdkWjbzLLCLO5Wtavp7hpLXQ+2FbEFEOwUZa0TfV316YnABJHeHkdTdB
         Y3XLHF5AS/+BiDgWsHceCpWbXgq+Jum9f5n0pJjD0nmJxMJ2/KV/b+Zk4SvoNOE3u8CH
         Qocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:cc
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language;
        bh=VkZY6ivpKX83X0G3u+jmfvPQOW36EKG9dRiUi92r6YE=;
        b=eMNViZ3U3MzPebITWqiHOYRuepHnerxDs5fvbPy3Ssc1+0Yh/wBZN7NxdjJGy0+KuC
         9fyDom+qXIl8udtLht1FJD8ZY+iXaVGiuztn3yJ9ypooVfOfoCaAcrNL2Eo4WUnPb0aB
         O3Mg1em6BuVWB3ja0Wvyt+NR4zKoh16KSZJxWVzgvc4sx5KghmxZGMoMghc/4Ly5c7p1
         oMhB+M0mibWQ6fSXQZvdZVoUObVoJlbshWApNcvhfCRXvTGbgRd7/wkV8ZITRSpgJHQU
         G+6Sv3ny8cCrJg3ah//iM6dfNYZ1F+OqJFWScj07NOfVwsrOExOVtOjPDPbO9WgsdqHH
         0nrg==
X-Gm-Message-State: AGi0PuZJ+X0cDOt5+ZT7s3BhKox74hbPuV3PsBje+gA+OF3h4YO+ouU8
	NsTBXy7YBissyGL7ezqA+yttdL6xLkMxsQ==
X-Google-Smtp-Source: APiQypIFBDx9azWiPp3yANirGMVUXJj85gM7UlKFtNolUBzAy4W9MnUxUyLSzbOlQI8Z6OtaewqOIw==
X-Received: by 2002:aa7:8696:: with SMTP id d22mr29686506pfo.54.1586990367513;
        Wed, 15 Apr 2020 15:39:27 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:c885:40f8:b7ee:f5bd? ([2601:202:4180:a5c0:c885:40f8:b7ee:f5bd])
        by smtp.gmail.com with ESMTPSA id a12sm8358453pfr.28.2020.04.15.15.39.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2020 15:39:26 -0700 (PDT)
Subject: Re: [docs] [PATCH 2/2] ref-manual: add migration section for 3.1
To: "bluelightning@bluelightning.org" <bluelightning@bluelightning.org>
References: <cover.1586987359.git.bluelightning@bluelightning.org>
 <387de38945c4514c58edf915474a2ec474539746.1586987359.git.bluelightning@bluelightning.org>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Cc: docs@lists.yoctoproject.org
Message-ID: <a2ada06c-7958-a14a-318c-12a945833a67@gmail.com>
Date: Wed, 15 Apr 2020 15:39:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <387de38945c4514c58edf915474a2ec474539746.1586987359.git.bluelightning@bluelightning.org>
Content-Type: multipart/alternative;
 boundary="------------B926DF67F3382D27575A5BD5"
Content-Language: en-US

--------------B926DF67F3382D27575A5BD5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Paul,

On 4/15/20 2:49 PM, Paul Eggleton wrote:
> From: Paul Eggleton <paul.eggleton@microsoft.com>
>
> Migration information for the 3.1 release.

Thanks for pulling this together. I have in-lined a few questions below.
>
> Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
> ---
>  documentation/ref-manual/migration.xml | 201 +++++++++++++++++++++++++
>  1 file changed, 201 insertions(+)
>
> diff --git a/documentation/ref-manual/migration.xml b/documentation/ref-=
manual/migration.xml
> index 03efc7be2..9422b5a27 100644
> --- a/documentation/ref-manual/migration.xml
> +++ b/documentation/ref-manual/migration.xml
> @@ -7095,6 +7095,207 @@ id=3Df4d4f99cfbc2396e49c1613a7d237b9e57f06f81'>c=
ommit message</ulink>.
>      </section>
>  </section>
>  
> +
> +<section id=3D'moving-to-the-yocto-project-3.1-release'>
> +    <title>Moving to the Yocto Project 3.1 Release</title>
> +
> +    <para>
> +        This section provides migration information for moving to the
> +        Yocto Project 3.1 Release from the prior release.
> +    </para>
> +
> +    <section id=3D'migration-3.1-minimum-system-requirements'>
> +        <title>Minimum system requirements</title>
> +
> +        <para>
> +            The following versions / requirements of build host compone=
nts have been updated:
> +            <itemizedlist>
> +                <listitem><para>gcc 5.0</para></listitem>
> +                <listitem><para>python 3.5</para></listitem>
> +                <listitem><para>tar 1.28</para></listitem>
> +                <listitem><para><filename>rpcgen</filename> is now requ=
ired on the host (part of the <filename>libc-dev-bin</filename> package on =
Ubuntu, Debian and related distributions, and the <filename>glibc</filename=
> package on RPM-based distributions).</para></listitem>
> +            </itemizedlist>
> +            
> +            Additionally, the <filename>makeinfo</filename> and <filena=
me>pod2man</filename>
> +            tools are <emphasis>no longer</emphasis> required on the ho=
st.
> +        </para>
> +    </section>
> +
> +    <section id=3D'migration-3.1-mpc8315e-rdb-removed'>
> +        <title>mpc8315e-rdb machine removed</title>
> +
> +        <para>
> +            The MPC8315E-RDB machine is old/obsolete and unobtainable, =
thus given the maintenance burden
> +            the <filename>mpc8315e-rdb</filename> machine configuration=
 that supported it has been removed
> +            in this release. The removal does leave a gap in official P=
owerPC reference hardware
> +            support; this may change in future if a suitable machine wi=
th accompanying support resources
> +            is found.
> +        </para>
> +    </section>
> +    
> +    <section id=3D'migration-3.1-python-2-removed'>
> +        <title>Python 2 removed</title>
> +
> +        <para>
> +            Due to the expiration of upstream support in January 2020, =
support for Python 2 has now been removed; it is recommended that you use P=
ython 3 instead. If absolutely needed there is a meta-python2 community lay=
er containing Python 2, related classes and various Python 2-based modules,=
 however it should not be considered as supported.
> +        </para>
> +    </section>
> +
> +    <section id=3D'migration-3.1-reproducible-builds'>
> +        <title>Reproducible builds now enabled by default</title>
> +
> +        <para>
> +            In order to avoid unnecessary differences in output files (=
aiding binary reproducibility), the Poky distribution configuration (<filen=
ame><link linkend=3D'var-DISTRO'>DISTRO</link> =3D "poky"</filename>) now i=
nherits the <filename>reproducible_build</filename> class by default.
> +        </para>
> +    </section>

AK] I think the l hash equivalence server is also enabled by default:

commit 1fb4aa42f9c3b9738d78d198ad695fe4fcb6dc2f
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:=C2=A0=C2=A0 Wed Aug 7 21:56:01 2019 +0100

=C2=A0=C2=A0=C2=A0 poky: Default to enabling a local hash equivalence serv=
er
=C2=A0=C2=A0=C2=A0

> +    
> +    <section id=3D'migration-3.1-ptest-feature-impact'>
> +        <title>Impact of ptest feature is now more significant</title>
> +
> +        <para>
> +            The Poky distribution configuration (<filename><link linken=
d=3D'var-DISTRO'>DISTRO</link> =3D "poky"</filename>) enables ptests by def=
ault to enable runtime testing of various components. In this release, a de=
pendency needed to be added that has resulted in a significant increase in =
the number of components that will be built just when building a simple ima=
ge such as core-image-minimal. If you do not need runtime tests enabled for=
 core components, then it is recommended that you remove "ptest" from <link=
 linkend=3D'var-DISTRO_FEATURES'><filename>DISTRO_FEATURES</filename></link=
> to save a significant amount of build time e.g. by adding the following i=
n your configuration:
> +
> +            <literallayout class=3D'monospaced'>
> +      DISTRO_FEATURES_remove =3D "ptest"
> +            </literallayout>
> +        </para>
> +    </section>
> +
> +    <section id=3D'migration-3.1-removed-recipes'>
> +        <title>Removed recipes</title>
> +
> +        <para>
> +            The following recipes have been removed:
> +
> +            <itemizedlist>
> +                <listitem><para><filename>chkconfig</filename>: obsolet=
e</para></listitem>
> +                <listitem><para><filename>console-tools</filename>: obs=
olete</para></listitem>
> +                <listitem><para><filename>enchant</filename>: replaced =
by <filename>enchant2</filename></para></listitem>
> +                <listitem><para><filename>foomatic-filters</filename>: =
obsolete</para></listitem>
> +                <listitem><para><filename>libidn</filename>: no longer =
needed, moved to meta-oe</para></listitem>
> +                <listitem><para><filename>libmodulemd</filename>: repla=
ced by <filename>libmodulemd-v1</filename></para></listitem>
> +                <listitem><para><filename>linux-yocto</filename>: drop =
4.19, 5.2 version recipes (5.4 now provided)</para></listitem>
> +                <listitem><para><filename>nspr</filename>: no longer ne=
eded, moved to meta-oe</para></listitem>
> +                <listitem><para><filename>nss</filename>: no longer nee=
ded, moved to meta-oe</para></listitem>
> +                <listitem><para><filename>python</filename>: Python 2 r=
emoved (Python 3 preferred)</para></listitem>
> +                <listitem><para><filename>python-setuptools</filename>:=
 Python 2 version removed (python3-setuptools preferred)</para></listitem>
> +                <listitem><para><filename>sysprof</filename>: no longer=
 needed, moved to meta-oe</para></listitem>
> +                <listitem><para><filename>texi2html</filename>: obsolet=
e</para></listitem>
> +                <listitem><para><filename>u-boot-fw-utils</filename>: f=
unctionally replaced by <filename>libubootenv</filename></para></listitem>
> +            </itemizedlist>
> +        </para>
> +    </section>
> +
> +    <section id=3D'migration-3.1-features-check'>
> +        <title>features_check class replaces distro_features_check</tit=
le>
> +
> +        <para>
> +            The <filename>distro_features_check</filename> class has ha=
d its functionality expanded, now supporting <filename>ANY_OF_MACHINE_FEATU=
RES</filename>, <filename>REQUIRED_MACHINE_FEATURES</filename>, <filename>C=
ONFLICT_MACHINE_FEATURES</filename>, <filename>ANY_OF_COMBINED_FEATURES</fi=
lename>, <filename>REQUIRED_COMBINED_FEATURES</filename>, <filename>CONFLIC=
T_COMBINED_FEATURES</filename>. As a result the class has now been renamed =
to <filename>features_check</filename>; the <filename>distro_features_check=
</filename> class still exists but generates a warning and redirects to the=
 new class. In preparation for a future removal of the old class it is reco=
mmended that you update recipes currently inheriting <filename>distro_featu=
res_check</filename> to inherit <filename>features_check</filename> instead=
.
> +        </para>
> +    </section>
> +
> +    <section id=3D'migration-3.1-removed-classes'>
> +        <title>Removed classes</title>
> +
> +        <para>
> +            The following classes have been removed:
> +
> +            <itemizedlist>
> +                <listitem><para><filename>distutils-base</filename>: mo=
ved to meta-python2</para></listitem>
> +                <listitem><para><filename>distutils</filename>: moved t=
o meta-python2</para></listitem>
> +                <listitem><para><filename>libc-common</filename>: merge=
d into the glibc recipe as nothing else used it.</para></listitem>
> +                <listitem><para><filename>python-dir</filename>: moved =
to meta-python2</para></listitem>
> +                <listitem><para><filename>pythonnative</filename>: move=
d to meta-python2</para></listitem>
> +                <listitem><para><filename>setuptools</filename>: moved =
to meta-python2</para></listitem>
> +                <listitem><para><filename>tinderclient</filename>: drop=
ped as it was obsolete.</para></listitem>
> +            </itemizedlist>
> +        </para>
> +    </section>
> +
> +    <section id=3D'migration-3.1-src-uri-checksums'>
> +        <title>SRC_URI checksum behaviour</title>
> +
> +        <para>
> +            Previously, recipes by tradition included both SHA256 and M=
D5 checksums for remotely fetched files in <link linkend=3D'var-SRC_URI'><f=
ilename>SRC_URI</filename></link>, even though only one is actually mandate=
d. However, the MD5 checksum does not add much given its inherent weakness;=
 thus when a checksum fails only the SHA256 sum will now be printed. The md=
5sum will still be verified if it is specified.

AK] If I am not mistaken, we can support all these in a recipe:=C2=A0 "md5=
",
"sha256", "sha1", "sha384", "sha512"

ref: bitbake/lib/bb/fetch2/__init__.py ; CHECKSUM_LIST

Not sure if we want to mention that too??? not saying it has to include
this.

> +        </para>
> +    </section>
> +
> +
> +    <section id=3D'migration-3.1-npm'>
> +        <title>npm fetcher changes</title>
> +
> +        <para>
> +            The npm fetcher has been completely reworked in this releas=
e. The npm fetcher now only fetches the package source itself and no longer=
 the dependencies; there is now also an npmsw fetcher which explicitly fetc=
hes the shrinkwrap file and the dependencies. This removes the slightly awk=
ward <filename>NPM_LOCKDOWN</filename> and <filename>NPM_SHRINKWRAP</filena=
me> variables which pointed to local files; the lockdown file is no longer =
needed at all. Additionally, the package name in <filename>npm://</filename=
> entries in <link linkend=3D'var-SRC_URI'><filename>SRC_URI</filename></li=
nk> is now specified using a <filename>package</filename> parameter instead=
 of the earlier <filename>name</filename> which overlapped with the generic=
 <filename>name</filename> parameter. All recipes using the npm fetcher wil=
l need to be changed as a result.=20
> +        </para>
> +        <para>
> +            An example of the new scheme:
> +            <literallayout class=3D'monospaced'>
> +SRC_URI =3D "npm://registry.npmjs.org;package=3Darray-flatten;version=
=3D1.1.1 \
> +           npmsw://${THISDIR}/npm-shrinkwrap.json"
> +            </literallayout>
> +            Another example where the sources are fetched from git rath=
er than an npm repository:
> +            <literallayout class=3D'monospaced'>
> +SRC_URI =3D "git://github.com/foo/bar.git;protocol=3Dhttps \
> +           npmsw://${THISDIR}/npm-shrinkwrap.json"
> +            </literallayout>
> +        </para>
> +        <para>
> +            devtool and recipetool have also been updated to match with=
 the npm fetcher changes. Other than producing working and more complete re=
cipes for npm sources, there is also a minor change to the command line for=
 devtool: the <filename>--fetch-dev</filename> option has been renamed to <=
filename>--npm-dev</filename> as it is npm-specific.
> +        </para>
> +    </section>
> +    
> +    
> +    <section id=3D'migration-3.1-packaging-changes'>
> +        <title>Packaging changes</title>
> +
> +        <para>
> +            <itemizedlist>
> +                <listitem><para><filename>intltool</filename> has been =
removed from <filename>packagegroup-core-sdk</filename> as it is rarely nee=
ded to build modern software - gettext can do most of the things it used to=
 be needed for. <filename>intltool</filename> has also been removed from <f=
ilename>packagegroup-core-self-hosted</filename> as it is not needed to for=
 standard builds.</para></listitem>
> +                <listitem><para>git: <filename>git-am</filename>, <file=
name>git-difftool</filename>, <filename>git-submodule</filename>, and <file=
name>git-request-pull</filename> are no longer perl-based, so are now insta=
lled with the main <filename>git</filename> package instead of within <file=
name>git-perltools</filename>.</para></listitem>
> +                <listitem><para>The <filename>ldconfig</filename> binar=
y built as part of glibc has now been moved to its own <filename>ldconfig</=
filename> package (note no <filename>glibc-</filename> prefix). This packag=
e is in the <link linkend=3D'var-RRECOMMENDS'><filename>RRECOMMENDS</filena=
me></link> of the main <filename>glibc</filename> package if <filename>ldco=
nfig</filename> is present in <link linkend=3D'var-DISTRO_FEATURES'><filena=
me>DISTRO_FEATURES</filename></link>.</para></listitem>
> +                <listitem><para><filename>libevent</filename> now split=
s each shared library into its own package (as Debian does). Since these ar=
e shared libraries and will be pulled in through the normal shared library =
dependency handling, there should be no impact to existing configurations o=
ther than less unnecessary libraries being installed in some cases.</para><=
/listitem>
> +                <listitem><para>linux-firmware now has a new package fo=
r <filename>bcm4366c</filename> and includes available NVRAM config files i=
nto the <filename>bcm43340</filename>, <filename>bcm43362</filename>, <file=
name>bcm43430</filename> and <filename>bcm4356-pcie</filename> packages.</p=
ara></listitem>
> +                <listitem><para><filename>harfbuzz</filename> now split=
s the new <filename>libharfbuzz-subset.so</filename> library into its own p=
ackage to reduce the main package size in cases where <filename>libharfbuzz=
-subset.so</filename> is not needed.</para></listitem>
> +            </itemizedlist>
> +        </para>
> +    </section>
> +    
> +    <section id=3D'migration-3.1-package-qa-warnings'>
> +        <title>Additional warnings</title>
> +
> +        <para>
> +            Warnings will now be shown at <filename>do_package_qa</file=
name> time in the following circumstances:
> +            
> +            <itemizedlist>
> +                <listitem><para>A recipe installs <filename>.desktop</f=
ilename> files containing <filename>MimeType</filename> keys but does not i=
nherit the new <filename>mime-xdg</filename> class</para></listitem>
> +                <listitem><para>A recipe installs <filename>.xml</filen=
ame> files into <filename>${datadir}/mime/packages</filename> but does not =
inherit the <filename>mime</filename> class</para></listitem>
> +            </itemizedlist>
> +        </para>
> +    </section>
> +        
> +    <section id=3D'migration-3.1-x86-live-wic'>
> +        <title><filename>wic</filename> image type now used instead of =
<filename>live</filename> by default for x86</title>
> +
> +        <para>
> +            <filename>conf/machine/include/x86-base.inc</filename> (inh=
erited by most x86 machine configurations) now specifies <filename>wic</fil=
ename> instead of <filename>live</filename> by default in <link linkend=3D'=
var-IMAGE_FSTYPES'><filename>IMAGE_FSTYPES</filename></link>. The <filename=
>live</filename> image type will likely be removed in a future release so i=
t is recommended that you use <filename>wic</filename> instead.
> +        </para>
> +    </section>
> +                
> +    <section id=3D'migration-3.1-misc'>
> +        <title>Miscellaneous changes</title>
> +
> +        <para>
> +            <itemizedlist>
> +                <listitem><para>The undocumented <filename>SRC_DISTRIBU=
TE_LICENSES</filename> variable has now been removed in favour of a new <fi=
lename>AVAILABLE_LICENSES</filename> variable which is dynamically set base=
d upon license files found in <filename>${COMMON_LICENSE_DIR}</filename> an=
d <filename>${LICENSE_PATH}</filename>.</para></listitem>
> +                <listitem><para>The tune definition for big-endian micr=
oblaze machines is now <filename>microblaze</filename> instead of <filename=
>microblazeeb</filename>.</para></listitem>
> +                <listitem><para><filename>newlib</filename> no longer h=
as built-in syscalls. <filename>libgloss</filename> should then provide the=
 syscalls, <filename>crt0.o</filename> and other functions that are no long=
er part of <filename>newlib</filename> itself. If you are using <filename>T=
CLIBC =3D "newlib"</filename> this now means that you must link application=
s with both <filename>newlib</filename> and <filename>libgloss</filename>, =
whereas before <filename>newlib</filename> would run in many configurations=
 by itself.</para></listitem>
> +            </itemizedlist>
> +        </para>
> +    </section>
> +
> +</section>
> +
> +
>  </chapter>
>  <!--
>  vim: expandtab tw=3D80 ts=3D4
>
>=20


--------------B926DF67F3382D27575A5BD5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Paul,<br>
    <br>
    <div class="moz-cite-prefix">On 4/15/20 2:49 PM, Paul Eggleton
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:387de38945c4514c58edf915474a2ec474539746.1586987359.git.bluelightning@bluelightning.org">
      <pre class="moz-quote-pre" wrap="">From: Paul Eggleton <a class="moz-txt-link-rfc2396E" href="mailto:paul.eggleton@microsoft.com">&lt;paul.eggleton@microsoft.com&gt;</a>

Migration information for the 3.1 release.</pre>
    </blockquote>
    <br>
    Thanks for pulling this together. I have in-lined a few questions
    below.<br>
    <blockquote type="cite"
cite="mid:387de38945c4514c58edf915474a2ec474539746.1586987359.git.bluelightning@bluelightning.org">
      <pre class="moz-quote-pre" wrap="">

Signed-off-by: Paul Eggleton <a class="moz-txt-link-rfc2396E" href="mailto:paul.eggleton@microsoft.com">&lt;paul.eggleton@microsoft.com&gt;</a>
---
 documentation/ref-manual/migration.xml | 201 +++++++++++++++++++++++++
 1 file changed, 201 insertions(+)

diff --git a/documentation/ref-manual/migration.xml b/documentation/ref-manual/migration.xml
index 03efc7be2..9422b5a27 100644
--- a/documentation/ref-manual/migration.xml
+++ b/documentation/ref-manual/migration.xml
@@ -7095,6 +7095,207 @@ id=f4d4f99cfbc2396e49c1613a7d237b9e57f06f81'&gt;commit message&lt;/ulink&gt;.
     &lt;/section&gt;
 &lt;/section&gt;
 
+
+&lt;section id='moving-to-the-yocto-project-3.1-release'&gt;
+    &lt;title&gt;Moving to the Yocto Project 3.1 Release&lt;/title&gt;
+
+    &lt;para&gt;
+        This section provides migration information for moving to the
+        Yocto Project 3.1 Release from the prior release.
+    &lt;/para&gt;
+
+    &lt;section id='migration-3.1-minimum-system-requirements'&gt;
+        &lt;title&gt;Minimum system requirements&lt;/title&gt;
+
+        &lt;para&gt;
+            The following versions / requirements of build host components have been updated:
+            &lt;itemizedlist&gt;
+                &lt;listitem&gt;&lt;para&gt;gcc 5.0&lt;/para&gt;&lt;/listitem&gt;
+                &lt;listitem&gt;&lt;para&gt;python 3.5&lt;/para&gt;&lt;/listitem&gt;
+                &lt;listitem&gt;&lt;para&gt;tar 1.28&lt;/para&gt;&lt;/listitem&gt;
+                &lt;listitem&gt;&lt;para&gt;&lt;filename&gt;rpcgen&lt;/filename&gt; is now required on the host (part of the &lt;filename&gt;libc-dev-bin&lt;/filename&gt; package on Ubuntu, Debian and related distributions, and the &lt;filename&gt;glibc&lt;/filename&gt; package on RPM-based distributions).&lt;/para&gt;&lt;/listitem&gt;
+            &lt;/itemizedlist&gt;
+            
+            Additionally, the &lt;filename&gt;makeinfo&lt;/filename&gt; and &lt;filename&gt;pod2man&lt;/filename&gt;
+            tools are &lt;emphasis&gt;no longer&lt;/emphasis&gt; required on the host.
+        &lt;/para&gt;
+    &lt;/section&gt;
+
+    &lt;section id='migration-3.1-mpc8315e-rdb-removed'&gt;
+        &lt;title&gt;mpc8315e-rdb machine removed&lt;/title&gt;
+
+        &lt;para&gt;
+            The MPC8315E-RDB machine is old/obsolete and unobtainable, thus given the maintenance burden
+            the &lt;filename&gt;mpc8315e-rdb&lt;/filename&gt; machine configuration that supported it has been removed
+            in this release. The removal does leave a gap in official PowerPC reference hardware
+            support; this may change in future if a suitable machine with accompanying support resources
+            is found.
+        &lt;/para&gt;
+    &lt;/section&gt;
+    
+    &lt;section id='migration-3.1-python-2-removed'&gt;
+        &lt;title&gt;Python 2 removed&lt;/title&gt;
+
+        &lt;para&gt;
+            Due to the expiration of upstream support in January 2020, support for Python 2 has now been removed; it is recommended that you use Python 3 instead. If absolutely needed there is a meta-python2 community layer containing Python 2, related classes and various Python 2-based modules, however it should not be considered as supported.
+        &lt;/para&gt;
+    &lt;/section&gt;
+
+    &lt;section id='migration-3.1-reproducible-builds'&gt;
+        &lt;title&gt;Reproducible builds now enabled by default&lt;/title&gt;
+
+        &lt;para&gt;
+            In order to avoid unnecessary differences in output files (aiding binary reproducibility), the Poky distribution configuration (&lt;filename&gt;&lt;link linkend='var-DISTRO'&gt;DISTRO&lt;/link&gt; = "poky"&lt;/filename&gt;) now inherits the &lt;filename&gt;reproducible_build&lt;/filename&gt; class by default.
+        &lt;/para&gt;
+    &lt;/section&gt;</pre>
    </blockquote>
    <br>
    AK] I think the l hash equivalence server is also enabled by
    default: <br>
    <br>
    commit 1fb4aa42f9c3b9738d78d198ad695fe4fcb6dc2f<br>
    Author: Richard Purdie <a class="moz-txt-link-rfc2396E" href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a><br>
    Date:   Wed Aug 7 21:56:01 2019 +0100<br>
    <br>
        poky: Default to enabling a local hash equivalence server<br>
        <br>
    <br>
    <blockquote type="cite"
cite="mid:387de38945c4514c58edf915474a2ec474539746.1586987359.git.bluelightning@bluelightning.org">
      <pre class="moz-quote-pre" wrap="">
+    
+    &lt;section id='migration-3.1-ptest-feature-impact'&gt;
+        &lt;title&gt;Impact of ptest feature is now more significant&lt;/title&gt;
+
+        &lt;para&gt;
+            The Poky distribution configuration (&lt;filename&gt;&lt;link linkend='var-DISTRO'&gt;DISTRO&lt;/link&gt; = "poky"&lt;/filename&gt;) enables ptests by default to enable runtime testing of various components. In this release, a dependency needed to be added that has resulted in a significant increase in the number of components that will be built just when building a simple image such as core-image-minimal. If you do not need runtime tests enabled for core components, then it is recommended that you remove "ptest" from &lt;link linkend='var-DISTRO_FEATURES'&gt;&lt;filename&gt;DISTRO_FEATURES&lt;/filename&gt;&lt;/link&gt; to save a significant amount of build time e.g. by adding the following in your configuration:
+
+            &lt;literallayout class='monospaced'&gt;
+      DISTRO_FEATURES_remove = "ptest"
+            &lt;/literallayout&gt;
+        &lt;/para&gt;
+    &lt;/section&gt;
+
+    &lt;section id='migration-3.1-removed-recipes'&gt;
+        &lt;title&gt;Removed recipes&lt;/title&gt;
+
+        &lt;para&gt;
+            The following recipes have been removed:
+
+            &lt;itemizedlist&gt;
+                &lt;listitem&gt;&lt;para&gt;&lt;filename&gt;chkconfig&lt;/filename&gt;: obsolete&lt;/para&gt;&lt;/listitem&gt;
+                &lt;listitem&gt;&lt;para&gt;&lt;filename&gt;console-tools&lt;/filename&gt;: obsolete&lt;/para&gt;&lt;/listitem&gt;
+                &lt;listitem&gt;&lt;para&gt;&lt;filename&gt;enchant&lt;/filename&gt;: replaced by &lt;filename&gt;enchant2&lt;/filename&gt;&lt;/para&gt;&lt;/listitem&gt;
+                &lt;listitem&gt;&lt;para&gt;&lt;filename&gt;foomatic-filters&lt;/filename&gt;: obsolete&lt;/para&gt;&lt;/listitem&gt;
+                &lt;listitem&gt;&lt;para&gt;&lt;filename&gt;libidn&lt;/filename&gt;: no longer needed, moved to meta-oe&lt;/para&gt;&lt;/listitem&gt;
+                &lt;listitem&gt;&lt;para&gt;&lt;filename&gt;libmodulemd&lt;/filename&gt;: replaced by &lt;filename&gt;libmodulemd-v1&lt;/filename&gt;&lt;/para&gt;&lt;/listitem&gt;
+                &lt;listitem&gt;&lt;para&gt;&lt;filename&gt;linux-yocto&lt;/filename&gt;: drop 4.19, 5.2 version recipes (5.4 now provided)&lt;/para&gt;&lt;/listitem&gt;
+                &lt;listitem&gt;&lt;para&gt;&lt;filename&gt;nspr&lt;/filename&gt;: no longer needed, moved to meta-oe&lt;/para&gt;&lt;/listitem&gt;
+                &lt;listitem&gt;&lt;para&gt;&lt;filename&gt;nss&lt;/filename&gt;: no longer needed, moved to meta-oe&lt;/para&gt;&lt;/listitem&gt;
+                &lt;listitem&gt;&lt;para&gt;&lt;filename&gt;python&lt;/filename&gt;: Python 2 removed (Python 3 preferred)&lt;/para&gt;&lt;/listitem&gt;
+                &lt;listitem&gt;&lt;para&gt;&lt;filename&gt;python-setuptools&lt;/filename&gt;: Python 2 version removed (python3-setuptools preferred)&lt;/para&gt;&lt;/listitem&gt;
+                &lt;listitem&gt;&lt;para&gt;&lt;filename&gt;sysprof&lt;/filename&gt;: no longer needed, moved to meta-oe&lt;/para&gt;&lt;/listitem&gt;
+                &lt;listitem&gt;&lt;para&gt;&lt;filename&gt;texi2html&lt;/filename&gt;: obsolete&lt;/para&gt;&lt;/listitem&gt;
+                &lt;listitem&gt;&lt;para&gt;&lt;filename&gt;u-boot-fw-utils&lt;/filename&gt;: functionally replaced by &lt;filename&gt;libubootenv&lt;/filename&gt;&lt;/para&gt;&lt;/listitem&gt;
+            &lt;/itemizedlist&gt;
+        &lt;/para&gt;
+    &lt;/section&gt;
+
+    &lt;section id='migration-3.1-features-check'&gt;
+        &lt;title&gt;features_check class replaces distro_features_check&lt;/title&gt;
+
+        &lt;para&gt;
+            The &lt;filename&gt;distro_features_check&lt;/filename&gt; class has had its functionality expanded, now supporting &lt;filename&gt;ANY_OF_MACHINE_FEATURES&lt;/filename&gt;, &lt;filename&gt;REQUIRED_MACHINE_FEATURES&lt;/filename&gt;, &lt;filename&gt;CONFLICT_MACHINE_FEATURES&lt;/filename&gt;, &lt;filename&gt;ANY_OF_COMBINED_FEATURES&lt;/filename&gt;, &lt;filename&gt;REQUIRED_COMBINED_FEATURES&lt;/filename&gt;, &lt;filename&gt;CONFLICT_COMBINED_FEATURES&lt;/filename&gt;. As a result the class has now been renamed to &lt;filename&gt;features_check&lt;/filename&gt;; the &lt;filename&gt;distro_features_check&lt;/filename&gt; class still exists but generates a warning and redirects to the new class. In preparation for a future removal of the old class it is recommended that you update recipes currently inheriting &lt;filename&gt;distro_features_check&lt;/filename&gt; to inherit &lt;filename&gt;features_check&lt;/filename&gt; instead.
+        &lt;/para&gt;
+    &lt;/section&gt;
+
+    &lt;section id='migration-3.1-removed-classes'&gt;
+        &lt;title&gt;Removed classes&lt;/title&gt;
+
+        &lt;para&gt;
+            The following classes have been removed:
+
+            &lt;itemizedlist&gt;
+                &lt;listitem&gt;&lt;para&gt;&lt;filename&gt;distutils-base&lt;/filename&gt;: moved to meta-python2&lt;/para&gt;&lt;/listitem&gt;
+                &lt;listitem&gt;&lt;para&gt;&lt;filename&gt;distutils&lt;/filename&gt;: moved to meta-python2&lt;/para&gt;&lt;/listitem&gt;
+                &lt;listitem&gt;&lt;para&gt;&lt;filename&gt;libc-common&lt;/filename&gt;: merged into the glibc recipe as nothing else used it.&lt;/para&gt;&lt;/listitem&gt;
+                &lt;listitem&gt;&lt;para&gt;&lt;filename&gt;python-dir&lt;/filename&gt;: moved to meta-python2&lt;/para&gt;&lt;/listitem&gt;
+                &lt;listitem&gt;&lt;para&gt;&lt;filename&gt;pythonnative&lt;/filename&gt;: moved to meta-python2&lt;/para&gt;&lt;/listitem&gt;
+                &lt;listitem&gt;&lt;para&gt;&lt;filename&gt;setuptools&lt;/filename&gt;: moved to meta-python2&lt;/para&gt;&lt;/listitem&gt;
+                &lt;listitem&gt;&lt;para&gt;&lt;filename&gt;tinderclient&lt;/filename&gt;: dropped as it was obsolete.&lt;/para&gt;&lt;/listitem&gt;
+            &lt;/itemizedlist&gt;
+        &lt;/para&gt;
+    &lt;/section&gt;
+
+    &lt;section id='migration-3.1-src-uri-checksums'&gt;
+        &lt;title&gt;SRC_URI checksum behaviour&lt;/title&gt;
+
+        &lt;para&gt;
+            Previously, recipes by tradition included both SHA256 and MD5 checksums for remotely fetched files in &lt;link linkend='var-SRC_URI'&gt;&lt;filename&gt;SRC_URI&lt;/filename&gt;&lt;/link&gt;, even though only one is actually mandated. However, the MD5 checksum does not add much given its inherent weakness; thus when a checksum fails only the SHA256 sum will now be printed. The md5sum will still be verified if it is specified.</pre>
    </blockquote>
    <br>
    AK] If I am not mistaken, we can support all these in a recipe: 
    "md5", "sha256", "sha1", "sha384", "sha512"<br>
    <br>
    ref: bitbake/lib/bb/fetch2/__init__.py ; CHECKSUM_LIST<br>
    <br>
    Not sure if we want to mention that too??? not saying it has to
    include this.<br>
    <br>
    <blockquote type="cite"
cite="mid:387de38945c4514c58edf915474a2ec474539746.1586987359.git.bluelightning@bluelightning.org">
      <pre class="moz-quote-pre" wrap="">
+        &lt;/para&gt;
+    &lt;/section&gt;
+
+
+    &lt;section id='migration-3.1-npm'&gt;
+        &lt;title&gt;npm fetcher changes&lt;/title&gt;
+
+        &lt;para&gt;
+            The npm fetcher has been completely reworked in this release. The npm fetcher now only fetches the package source itself and no longer the dependencies; there is now also an npmsw fetcher which explicitly fetches the shrinkwrap file and the dependencies. This removes the slightly awkward &lt;filename&gt;NPM_LOCKDOWN&lt;/filename&gt; and &lt;filename&gt;NPM_SHRINKWRAP&lt;/filename&gt; variables which pointed to local files; the lockdown file is no longer needed at all. Additionally, the package name in &lt;filename&gt;npm://&lt;/filename&gt; entries in &lt;link linkend='var-SRC_URI'&gt;&lt;filename&gt;SRC_URI&lt;/filename&gt;&lt;/link&gt; is now specified using a &lt;filename&gt;package&lt;/filename&gt; parameter instead of the earlier &lt;filename&gt;name&lt;/filename&gt; which overlapped with the generic &lt;filename&gt;name&lt;/filename&gt; parameter. All recipes using the npm fetcher will need to be changed as a result. 
+        &lt;/para&gt;
+        &lt;para&gt;
+            An example of the new scheme:
+            &lt;literallayout class='monospaced'&gt;
+SRC_URI = "npm://registry.npmjs.org;package=array-flatten;version=1.1.1 \
+           npmsw://${THISDIR}/npm-shrinkwrap.json"
+            &lt;/literallayout&gt;
+            Another example where the sources are fetched from git rather than an npm repository:
+            &lt;literallayout class='monospaced'&gt;
+SRC_URI = "git://github.com/foo/bar.git;protocol=https \
+           npmsw://${THISDIR}/npm-shrinkwrap.json"
+            &lt;/literallayout&gt;
+        &lt;/para&gt;
+        &lt;para&gt;
+            devtool and recipetool have also been updated to match with the npm fetcher changes. Other than producing working and more complete recipes for npm sources, there is also a minor change to the command line for devtool: the &lt;filename&gt;--fetch-dev&lt;/filename&gt; option has been renamed to &lt;filename&gt;--npm-dev&lt;/filename&gt; as it is npm-specific.
+        &lt;/para&gt;
+    &lt;/section&gt;
+    
+    
+    &lt;section id='migration-3.1-packaging-changes'&gt;
+        &lt;title&gt;Packaging changes&lt;/title&gt;
+
+        &lt;para&gt;
+            &lt;itemizedlist&gt;
+                &lt;listitem&gt;&lt;para&gt;&lt;filename&gt;intltool&lt;/filename&gt; has been removed from &lt;filename&gt;packagegroup-core-sdk&lt;/filename&gt; as it is rarely needed to build modern software - gettext can do most of the things it used to be needed for. &lt;filename&gt;intltool&lt;/filename&gt; has also been removed from &lt;filename&gt;packagegroup-core-self-hosted&lt;/filename&gt; as it is not needed to for standard builds.&lt;/para&gt;&lt;/listitem&gt;
+                &lt;listitem&gt;&lt;para&gt;git: &lt;filename&gt;git-am&lt;/filename&gt;, &lt;filename&gt;git-difftool&lt;/filename&gt;, &lt;filename&gt;git-submodule&lt;/filename&gt;, and &lt;filename&gt;git-request-pull&lt;/filename&gt; are no longer perl-based, so are now installed with the main &lt;filename&gt;git&lt;/filename&gt; package instead of within &lt;filename&gt;git-perltools&lt;/filename&gt;.&lt;/para&gt;&lt;/listitem&gt;
+                &lt;listitem&gt;&lt;para&gt;The &lt;filename&gt;ldconfig&lt;/filename&gt; binary built as part of glibc has now been moved to its own &lt;filename&gt;ldconfig&lt;/filename&gt; package (note no &lt;filename&gt;glibc-&lt;/filename&gt; prefix). This package is in the &lt;link linkend='var-RRECOMMENDS'&gt;&lt;filename&gt;RRECOMMENDS&lt;/filename&gt;&lt;/link&gt; of the main &lt;filename&gt;glibc&lt;/filename&gt; package if &lt;filename&gt;ldconfig&lt;/filename&gt; is present in &lt;link linkend='var-DISTRO_FEATURES'&gt;&lt;filename&gt;DISTRO_FEATURES&lt;/filename&gt;&lt;/link&gt;.&lt;/para&gt;&lt;/listitem&gt;
+                &lt;listitem&gt;&lt;para&gt;&lt;filename&gt;libevent&lt;/filename&gt; now splits each shared library into its own package (as Debian does). Since these are shared libraries and will be pulled in through the normal shared library dependency handling, there should be no impact to existing configurations other than less unnecessary libraries being installed in some cases.&lt;/para&gt;&lt;/listitem&gt;
+                &lt;listitem&gt;&lt;para&gt;linux-firmware now has a new package for &lt;filename&gt;bcm4366c&lt;/filename&gt; and includes available NVRAM config files into the &lt;filename&gt;bcm43340&lt;/filename&gt;, &lt;filename&gt;bcm43362&lt;/filename&gt;, &lt;filename&gt;bcm43430&lt;/filename&gt; and &lt;filename&gt;bcm4356-pcie&lt;/filename&gt; packages.&lt;/para&gt;&lt;/listitem&gt;
+                &lt;listitem&gt;&lt;para&gt;&lt;filename&gt;harfbuzz&lt;/filename&gt; now splits the new &lt;filename&gt;libharfbuzz-subset.so&lt;/filename&gt; library into its own package to reduce the main package size in cases where &lt;filename&gt;libharfbuzz-subset.so&lt;/filename&gt; is not needed.&lt;/para&gt;&lt;/listitem&gt;
+            &lt;/itemizedlist&gt;
+        &lt;/para&gt;
+    &lt;/section&gt;
+    
+    &lt;section id='migration-3.1-package-qa-warnings'&gt;
+        &lt;title&gt;Additional warnings&lt;/title&gt;
+
+        &lt;para&gt;
+            Warnings will now be shown at &lt;filename&gt;do_package_qa&lt;/filename&gt; time in the following circumstances:
+            
+            &lt;itemizedlist&gt;
+                &lt;listitem&gt;&lt;para&gt;A recipe installs &lt;filename&gt;.desktop&lt;/filename&gt; files containing &lt;filename&gt;MimeType&lt;/filename&gt; keys but does not inherit the new &lt;filename&gt;mime-xdg&lt;/filename&gt; class&lt;/para&gt;&lt;/listitem&gt;
+                &lt;listitem&gt;&lt;para&gt;A recipe installs &lt;filename&gt;.xml&lt;/filename&gt; files into &lt;filename&gt;${datadir}/mime/packages&lt;/filename&gt; but does not inherit the &lt;filename&gt;mime&lt;/filename&gt; class&lt;/para&gt;&lt;/listitem&gt;
+            &lt;/itemizedlist&gt;
+        &lt;/para&gt;
+    &lt;/section&gt;
+        
+    &lt;section id='migration-3.1-x86-live-wic'&gt;
+        &lt;title&gt;&lt;filename&gt;wic&lt;/filename&gt; image type now used instead of &lt;filename&gt;live&lt;/filename&gt; by default for x86&lt;/title&gt;
+
+        &lt;para&gt;
+            &lt;filename&gt;conf/machine/include/x86-base.inc&lt;/filename&gt; (inherited by most x86 machine configurations) now specifies &lt;filename&gt;wic&lt;/filename&gt; instead of &lt;filename&gt;live&lt;/filename&gt; by default in &lt;link linkend='var-IMAGE_FSTYPES'&gt;&lt;filename&gt;IMAGE_FSTYPES&lt;/filename&gt;&lt;/link&gt;. The &lt;filename&gt;live&lt;/filename&gt; image type will likely be removed in a future release so it is recommended that you use &lt;filename&gt;wic&lt;/filename&gt; instead.
+        &lt;/para&gt;
+    &lt;/section&gt;
+                
+    &lt;section id='migration-3.1-misc'&gt;
+        &lt;title&gt;Miscellaneous changes&lt;/title&gt;
+
+        &lt;para&gt;
+            &lt;itemizedlist&gt;
+                &lt;listitem&gt;&lt;para&gt;The undocumented &lt;filename&gt;SRC_DISTRIBUTE_LICENSES&lt;/filename&gt; variable has now been removed in favour of a new &lt;filename&gt;AVAILABLE_LICENSES&lt;/filename&gt; variable which is dynamically set based upon license files found in &lt;filename&gt;${COMMON_LICENSE_DIR}&lt;/filename&gt; and &lt;filename&gt;${LICENSE_PATH}&lt;/filename&gt;.&lt;/para&gt;&lt;/listitem&gt;
+                &lt;listitem&gt;&lt;para&gt;The tune definition for big-endian microblaze machines is now &lt;filename&gt;microblaze&lt;/filename&gt; instead of &lt;filename&gt;microblazeeb&lt;/filename&gt;.&lt;/para&gt;&lt;/listitem&gt;
+                &lt;listitem&gt;&lt;para&gt;&lt;filename&gt;newlib&lt;/filename&gt; no longer has built-in syscalls. &lt;filename&gt;libgloss&lt;/filename&gt; should then provide the syscalls, &lt;filename&gt;crt0.o&lt;/filename&gt; and other functions that are no longer part of &lt;filename&gt;newlib&lt;/filename&gt; itself. If you are using &lt;filename&gt;TCLIBC = "newlib"&lt;/filename&gt; this now means that you must link applications with both &lt;filename&gt;newlib&lt;/filename&gt; and &lt;filename&gt;libgloss&lt;/filename&gt;, whereas before &lt;filename&gt;newlib&lt;/filename&gt; would run in many configurations by itself.&lt;/para&gt;&lt;/listitem&gt;
+            &lt;/itemizedlist&gt;
+        &lt;/para&gt;
+    &lt;/section&gt;
+
+&lt;/section&gt;
+
+
 &lt;/chapter&gt;
 &lt;!--
 vim: expandtab tw=80 ts=4
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------B926DF67F3382D27575A5BD5--
