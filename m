Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.18823.1582537577276689065
 for <docs@lists.yoctoproject.org>;
 Mon, 24 Feb 2020 01:46:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=dPNYLfeL;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=13168; q=dns/txt; s=axis-central1;
  t=1582537577; x=1614073577;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=EYYUyBkLjmdZnN4ADowiery9Ns55nDfYeh/xQHF199w=;
  b=dPNYLfeLvVonSklz3XbgCIjcJG7sW0aRyInlKYdKiGY7rx73nxhhtT6G
   5E4rQep29OoFtI4IWgG7hPOd3KQlM2kvgQ+Tpckb0Oix/8OEp4Mnxck4P
   fsQKRHGx97Xb2Dqovk0Sbm70Le9meU22pUIctFY0/T8X/GZuukC2NhHrl
   AL0SY522dnXuQlomwJJZ9bN4YoUC3wK/m2xE9zPYWaRXZJG0MgVeNeCHn
   Bcl9vuAmq2GgnCEOjZaSw7ELUlo75mHW6oEO/5RtSZVgfQph+PlQ3/3Rt
   PigDZvxLiZs7x9EBUm9Qt53cMcAHz872RWrfAhrRUh6A8RA/dLnP4Mtbc
   A==;
IronPort-SDR: yViYfH5SLRgW1wRWuFouNUnvWk+d6RZe3tdSZL25NB9luNXEGDrPVXvtagl67Vdo0tzrG75A2G
 TOrobApbaJj7RHrUi/BbSh0Da8aRQxnxRzC4cDVS5quu3S9uSeyszu0qMSOzdstC5ofD9Swwm+
 IsPvkt31Va8ekjSdSQI3sxdsZ6ho1kxq47mo/8SisViSqCwi1Y2EjSUQcrUSSNWqFDwuYDVOTK
 QotroTDnfNT9uWyxp7zk+vB7jxgArH9YhzDKUwLIWiUzuL4OeXfwfJ+hnhVEWq0sYYX6BzNsHj
 jQc=
X-IronPort-AV: E=Sophos;i="5.70,479,1574118000"; 
   d="scan'208";a="5585600"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] BSP Guide: numerous tweaks/grammar/wording/clarification
Thread-Topic: [docs] [PATCH] BSP Guide: numerous
 tweaks/grammar/wording/clarification
Thread-Index: AQHV6pQnKnC4WH1uXU2e0/WjBoS0D6gqFQvw
Date: Mon, 24 Feb 2020 09:46:10 +0000
Message-ID: <eb60f983320f464cbb9296afe1a82e24@XBOX03.axis.com>
References: <alpine.LFD.2.21.2002231655030.19378@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.21.2002231655030.19378@localhost.localdomain>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Return-Path: peter.kjellerstedt@axis.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: docs@lists.yoctoproject.org <docs@lists.yoctoproject.org> On Behalf=
 Of rpjday@crashcourse.ca
> Sent: den 23 februari 2020 22:57
> To: YP docs mailing list <docs@lists.yoctoproject.org>
> Subject: [docs] [PATCH] BSP Guide: numerous
> tweaks/grammar/wording/clarification
>=20
>=20
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>=20
> ---
>=20
>   was working on this earlier, but don't think i submitted any of this be=
fore now.
>=20
> diff --git a/documentation/bsp-guide/bsp.xml b/documentation/bsp-guide/bs=
p.xml
> index 58f5733f7..a0cb5aa26 100644
> --- a/documentation/bsp-guide/bsp.xml
> +++ b/documentation/bsp-guide/bsp.xml
> @@ -19,7 +19,7 @@
>  </para>
>=20
>  <para>
> -    This guide presents information about BSP Layers, defines a structur=
e for components
> +    This guide presents information about BSP layers, defines a structur=
e for components
>      so that BSPs follow a commonly understood layout, discusses how to c=
ustomize
>      a recipe for a BSP, addresses BSP licensing, and provides informatio=
n that
>      shows you how to create a
> @@ -34,7 +34,7 @@
>      <para>
>          A BSP consists of a file structure inside a base directory.
>          Collectively, you can think of the base directory, its file stru=
cture,
> -        and the contents as a BSP Layer.
> +        and the contents as a <firstterm>BSP layer</firstterm>.
>          Although not a strict requirement, BSP layers in the Yocto Proje=
ct
>          use the following well-established naming convention:
>          <literallayout class=3D'monospaced'>
> @@ -69,9 +69,9 @@
>          Each repository is a BSP layer supported by the Yocto Project
>          (e.g. <filename>meta-raspberrypi</filename> and
>          <filename>meta-intel</filename>).
> -        Each of these layers is a repository unto itself and clicking on=
 a
> -        layer reveals information that includes two links from which you=
 can choose
> -        to set up a clone of the layer's repository on your local host s=
ystem.
> +        Each of these layers is a repository unto itself and clicking on
> +        the layer name displays two URLs from which you can
> +        clone the layer's repository to your local system.
>          Here is an example that clones the Raspberry Pi BSP layer:
>          <literallayout class=3D'monospaced'>
>       $ git clone git://git.yoctoproject.org/meta-raspberrypi
> @@ -83,12 +83,13 @@
>          <filename>meta-yocto-bsp</filename> layer is part of the
>          shipped <filename>poky</filename> repository.
>          The <filename>meta-yocto-bsp</filename> layer maintains several
> -        BSPs such as the Beaglebone, EdgeRouter, and generic versions of
> +        "reference" BSPs including the ARM-based Beaglebone, MIPS-based
> +        EdgeRouter, and generic versions of
>          both 32-bit and 64-bit IA machines.
>      </para>
>=20
>      <para>
> -        For information on the BSP development workflow, see the
> +        For information on typical BSP development workflow, see the
>          "<link linkend=3D'developing-a-board-support-package-bsp'>Develo=
ping a Board Support Package (BSP)</link>"
>          section.
>          For more information on how to set up a local copy of source fil=
es
> @@ -98,12 +99,12 @@
>      </para>
>=20
>      <para>
> -        The layer's base directory
> +        The BSP layer's base directory
>          (<filename>meta-<replaceable>bsp_root_name</replaceable></filena=
me>)
> -        is the root directory of the BSP Layer.
> +        is the root directory of that Layer.

Change "Layer" to "layer".

>          This directory is what you add to the
>          <ulink url=3D'&YOCTO_DOCS_REF_URL;#var-BBLAYERS'><filename>BBLAY=
ERS</filename></ulink>
> -        variable in the <filename>conf/bblayers.conf</filename> file fou=
nd in the
> +        variable in the <filename>conf/bblayers.conf</filename> file fou=
nd in your
>          <ulink url=3D'&YOCTO_DOCS_REF_URL;#build-directory'>Build Direct=
ory</ulink>,
>          which is established after you run the OpenEmbedded build enviro=
nment
>          setup script (i.e.
> @@ -153,6 +154,20 @@
>          layer.
>          The <filename>meta-openembedded</filename> layer contains
>          many <filename>meta-*</filename> layers.
> +        In cases like this, you need to include the names of the actual
> +        layers you want to work with, such as:
> +        <literallayout class=3D'monospaced'>
> +     BBLAYERS ?=3D " \
> +       /usr/local/src/yocto/meta \
> +       /usr/local/src/yocto/meta-poky \
> +       /usr/local/src/yocto/meta-yocto-bsp \
> +       /usr/local/src/yocto/meta-mylayer \
> +       .../meta-openembedded/meta-oe \
> +       .../meta-openembedded/meta-perl \
> +       .../meta-openembedded/meta-networking \
> +       "
> +        </literallayout>
> +       and so on.
>      </para>
>=20
>      <para>
> @@ -351,25 +366,24 @@
>          layer combined with a build system and other tools.
>          Realize that it is important to maintain the distinction
>          that the BSP layer, a build system, and tools are
> -        separate components that could to be combined in
> +        separate components that could be combined in
>          certain end products.
>      </para>
>=20
>      <para>
> -        Before looking at the common form for the file structure
> -        inside a BSP Layer, you should be aware that some
> +        Before looking at the recommended form for the directory structu=
re
> +        inside a BSP layer, you should be aware that some
>          requirements do exist in order for a BSP layer to
> -        be considered compliant with the Yocto Project.
> +        be considered <firstterm>compliant</firstterm> with the Yocto Pr=
oject.
>          For that list of requirements, see the
>          "<link linkend=3D'released-bsp-requirements'>Released BSP Requir=
ements</link>"
>          section.
>      </para>
>=20
>      <para>
> -        Below is the common form for the file structure
> -        inside a BSP Layer.
> +        Below is the typical directory structure for a BSP layer.
>          While this basic form represents the standard,
> -        realize that the actual file structures for specific
> +        realize that the actual layout for individual
>          BSPs could differ.
>          <literallayout class=3D'monospaced'>
>       meta-<replaceable>bsp_root_name</replaceable>/
> @@ -567,7 +581,7 @@
>              for the BSP.
>              The type or types of files here can vary depending
>              on the licensing requirements.
> -            For example, in the Raspberry Pi BSP all licensing
> +            For example, in the Raspberry Pi BSP, all licensing
>              requirements are handled with the
>              <filename>COPYING.MIT</filename> file.
>          </para>
> @@ -802,7 +816,7 @@
>              <ulink url=3D'&YOCTO_DOCS_REF_URL;#source-directory'>Source =
Directory</ulink>.
>              For example, many <filename>tune-*</filename> files
>              (e.g. <filename>tune-arm1136jf-s.inc</filename>,
> -            <filename>tun-1586-nlp.inc</filename>, and so forth)
> +            <filename>tune-1586-nlp.inc</filename>, and so forth)
>              reside in the
>              <filename>poky/meta/conf/machine/include</filename>
>              directory.
> @@ -834,7 +848,7 @@
>              This optional directory contains miscellaneous recipe
>              files for the BSP.
>              Most notably would be the formfactor files.
> -            For example, in the Raspberry Pi BSP there is the
> +            For example, in the Raspberry Pi BSP, there is the
>              <filename>formfactor_0.0.bbappend</filename> file,
>              which is an append file used to augment the recipe
>              that starts the build.
> @@ -901,7 +915,7 @@
>              The <filename>*.bb</filename> files would be a
>              developer-supplied kernel recipe.
>              This area of the BSP hierarchy can contain both these
> -            types of files, although in practice, it is likely that
> +            types of files although, in practice, it is likely that
>              you would have one or the other.
>          </para>
>=20
> @@ -976,7 +990,7 @@
>      <title>Developing a Board Support Package (BSP)</title>
>=20
>      <para>
> -        This section contains the high-level procedure you can
> +        This section describes the high-level procedure you can
>          follow to create a BSP.
>          Although not required for BSP creation, the
>          <filename>meta-intel</filename> repository, which
> @@ -1302,7 +1316,7 @@
>                      (<filename>openembedded-core</filename>)
>                      or the Source Directory (<filename>poky</filename>).
>                      In other words, make sure you place related
> -                    files in appropriately related
> +                    files in appropriately-related
>                      <filename>recipes-*</filename> subdirectories
>                      specific to the recipe's function, or within
>                      a subdirectory containing a set of closely-related
> @@ -1319,7 +1333,7 @@
>                      directory.
>                      This license covers the BSP Metadata as a whole.
>                      You must specify which license to use since no
> -                    default license exists when one not specified.
> +                    default license exists when one is not specified.
>                      See the
>                      <ulink url=3D'&YOCTO_GIT_URL;/cgit.cgi/meta-raspberr=
ypi/tree/COPYING.MIT'><filename>COPYING.MIT</filename></ulink>
>                      file for the Raspberry Pi BSP in the
> @@ -1342,12 +1356,10 @@
>                      file should contain the following:
>                      <itemizedlist>
>                          <listitem><para>
> -                            A brief description about the hardware the B=
SP
> -                            targets.
> +                            A brief description of the target hardware.
>                              </para></listitem>
>                          <listitem><para>
> -                            A list of all the dependencies
> -                            on which a BSP layer depends.
> +                            A list of all the dependencies of the BSP.
>                              These dependencies are typically a list
>                              of required layers needed to build the
>                              BSP.
> @@ -1610,7 +1622,7 @@
>      <title>BSP Licensing Considerations</title>
>=20
>      <para>
> -        In some cases, a BSP contains separately licensed
> +        In some cases, a BSP contains separately-licensed
>          Intellectual Property (IP) for a component or components.
>          For these cases, you are required to accept the terms
>          of a commercial or other type of license that requires
> @@ -1623,7 +1635,7 @@
>      </para>
>=20
>      <para>
> -        You could find that some separately licensed components
> +        You could find that some separately-licensed components
>          that are essential for normal operation of the system might
>          not have an unencumbered (or free) substitute.
>          Without these essential components, the system would be
> @@ -1631,7 +1643,7 @@
>          Then again, you might find that other licensed components
>          that are simply 'good-to-have' or purely elective do have
>          an unencumbered, free replacement component that you can
> -        use rather than agreeing to the separately licensed
> +        use rather than agreeing to the separately-licensed
>          component.
>          Even for components essential to the system, you might
>          find an unencumbered component that is not identical but
> @@ -1744,7 +1756,7 @@
>      <para>
>          The <filename>bitbake-layers create-layer</filename> script
>          automates creating a BSP layer.
> -        What makes a layer a "BSP layer", is the presence of a machine
> +        What makes a layer a "BSP layer" is the presence of at least one=
 machine
>          configuration file.
>          Additionally, a BSP layer usually has a kernel recipe
>          or an append file that leverages off an existing kernel recipe.
> @@ -1868,11 +1880,14 @@
>          </para>
>=20
>          <para>
> -            Machine configuration files exist in the
> +            One or more machine configuration files exist in the
>              <replaceable>bsp_layer</replaceable><filename>/conf/machine/=
</filename>
>              directory of the layer:
>              <literallayout class=3D'monospaced'>
> -     <replaceable>bsp_layer</replaceable><filename>/conf/machine/</filen=
ame><replaceable>machine</replaceable><filename>.conf</filename>
> +     <replaceable>bsp_layer</replaceable><filename>/conf/machine/</filen=
ame><replaceable>machine1</replaceable><filename>.conf</filename>
> +     <replaceable>bsp_layer</replaceable><filename>/conf/machine/</filen=
ame><replaceable>machine2</replaceable><filename>.conf</filename>
> +     <replaceable>bsp_layer</replaceable><filename>/conf/machine/</filen=
ame><replaceable>machine3</replaceable><filename>.conf</filename>
> +     ... more ...
>              </literallayout>
>              For example, the machine configuration file for the
>              <ulink url=3D'http://beagleboard.org/bone'>BeagleBone and Be=
agleBone Black development boards</ulink>
> @@ -1923,8 +1938,8 @@
>       IMAGE_BOOT_FILES ?=3D "u-boot.${UBOOT_SUFFIX} MLO zImage am335x-bon=
e.dtb am335x-boneblack.dtb am335x-bonegreen.dtb"
>              </literallayout>
>              The variables used to configure the machine define
> -            machine-specific properties.
> -            For example, machine-dependent packages, machine
> +            machine-specific properties;
> +            for example, machine-dependent packages, machine
>              tunings, the type of kernel to build, and
>              U-Boot configurations.
>          </para>
> @@ -1935,7 +1950,7 @@
>              machine configuration file for the BeagleBone
>              development boards.
>              Realize that much more can be defined as part of
> -            a machines configuration file.
> +            a machine's configuration file.
>              In general, you can learn about related variables
>              that this example does not have by locating the
>              variables in the
>=20
> --
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                          http://crashcourse.ca
>=20
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

//Peter

