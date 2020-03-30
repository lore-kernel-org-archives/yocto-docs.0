Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.46856.1585562832378180647
 for <docs@lists.yoctoproject.org>;
 Mon, 30 Mar 2020 03:07:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=qEvXOFVG;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=9630; q=dns/txt; s=axis-central1;
  t=1585562832; x=1617098832;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=n2vAwzepdPHq9UBopr0V2bP0LaeHuM1PtdwJYtnBM6Y=;
  b=qEvXOFVGXZHJdG8CwCJ5+p8lcX8bJ/OWMCEH/UgegoPzXKruWZb16tB8
   IiRrJwijXS3WkQ788PyXnPpI/Oh71rs3pRelm6kw7gOmXz73VWFX0zV29
   Uf3Ji7Y99raVrwEG9Br/7TUsQvImtznmJ/4sJ2PJFnXbIJu0RXZQ3iVVh
   NYLHetIgudt1tieFrlOkthWr5MSterATfg4gfXT6l9CiopnRygRiJg3G7
   A7Qvo3s0gPTtdcuETJkkGyDyQ5qsSoJfJ1zdmKZoBMSneazHX3HLdRSVO
   PgPbMGq+ED9mY+2d5h3WtKOayorrCWylp594U7uH4XCQM9ochd5CA8BaV
   g==;
IronPort-SDR: GqM1N8PYN/5aY9POe02M55x+cDPml3PqyQl1/rPEH3Ah23OOm4sTvzfbAtfKqSepfWVqV8XQ61
 KBGnZyZtf5vCxQaMBR5vKjsPOIzPD6KQqToB9wL0LSY/VfcEcHCv29t21V0vFy/WSQ7C1pgQGH
 wHxPWr6/IK6iBbJ/WDEy/2pdyhRsOSV6Tfan2Zjy7/qCJeua5qFm2bTU5FWFmJzrlw7VztkvPC
 xtDQ0aqoFwL82iMJP1VmD5ac6/7E5CVtjkqHukpCTWCq/293YGzP5HMcXjoHL8bEyTELmhVKOC
 Stw=
X-IronPort-AV: E=Sophos;i="5.72,323,1580770800"; 
   d="scan'208";a="7091430"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Subject: Re: [docs] [PATCH 2/4] dev-manual: Document the WSLv2 install process
Thread-Topic: [docs] [PATCH 2/4] dev-manual: Document the WSLv2 install
 process
Thread-Index: AQHWBlYVWjdoXj31eUmhdKo6R3qlf6hg3SCQ
Date: Mon, 30 Mar 2020 10:07:09 +0000
Message-ID: <b5d45f4c63454bc18c837a6b63ff8869@XBOX03.axis.com>
References: <20200330054251.11134-1-alhe@linux.microsoft.com>
 <20200330054251.11134-2-alhe@linux.microsoft.com>
In-Reply-To: <20200330054251.11134-2-alhe@linux.microsoft.com>
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
> From: docs@lists.yoctoproject.org <docs@lists.yoctoproject.org> On Behalf
> Of alhe@linux.microsoft.com
> Sent: den 30 mars 2020 07:43
> To: docs@lists.yoctoproject.org
> Cc: richard.purdie@linuxfoundation.org
> Subject: [docs] [PATCH 2/4] dev-manual: Document the WSLv2 install proces=
s
>=20
> Signed-off-by: Alejandro Hernandez Samaniego <alejandro@enedino.org>
> Signed-off-by: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
> ---
>  documentation/dev-manual/dev-manual-start.xml | 145 +++++++++++++++++-
>  1 file changed, 139 insertions(+), 6 deletions(-)
>=20
> diff --git a/documentation/dev-manual/dev-manual-start.xml b/documentatio=
n/dev-manual/dev-manual-start.xml
> index 8d2f316f52..a588a37f06 100644
> --- a/documentation/dev-manual/dev-manual-start.xml
> +++ b/documentation/dev-manual/dev-manual-start.xml
> @@ -394,16 +394,16 @@
>          This section provides procedures to set up a system to be used a=
s your
>          <ulink url=3D'&YOCTO_DOCS_REF_URL;#hardware-build-system-term'>b=
uild host</ulink>
>          for development using the Yocto Project.
> -        Your build host can be a native Linux machine (recommended) or i=
t can
> +        Your build host can be a native Linux machine (recommended) it c=
an

Please restore the above as it was.

>          be a machine (Linux, Mac, or Windows) that uses
>          <ulink url=3D'https://github.com/crops/poky-container'>CROPS</ul=
ink>,
>          which leverages
> -        <ulink url=3D'https://www.docker.com/'>Docker Containers</ulink>=
.
> +        <ulink url=3D'https://www.docker.com/'>Docker Containers</ulink>=
 or it can
> +        be a Windows machine capable of running Windows Subsystem For Li=
nux v2 (WSL).
>          <note>
> -            You cannot use a build host that is using the
> -            <ulink url=3D'https://en.wikipedia.org/wiki/Windows_Subsyste=
m_for_Linux'>Windows Subsystem for Linux</ulink>
> -            (WSL).
> -            The Yocto Project is not compatible with WSL.
> +          The Yocto Project is not compatible with <ulink url=3D'https:/=
/en.wikipedia.org/wiki/Windows_Subsystem_for_Linux'>Windows Subsystem for L=
inux v1</ulink>
> +          , it is compatible but not officially supported nor validated =
with WSLv2,
> +          if you still decide to use WSL please upgrade to <ulink url=3D=
'https://docs.microsoft.com/en-us/windows/wsl/wsl2-install'>WSLv2</ulink>.

Change to:

            The Yocto Project is not compatible with
            <ulink url=3D'https://en.wikipedia.org/wiki/Windows_Subsystem_f=
or_Linux'>Windows Subsystem for Linux v1</ulink>.
            It is compatible, but not officially supported nor validated, w=
ith WSLv2.
            If you still decide to use WSL, please upgrade to
            <ulink url=3D'https://docs.microsoft.com/en-us/windows/wsl/wsl2=
-install'>WSLv2</ulink>.

//Peter

>          </note>
>      </para>
>=20
> @@ -654,6 +654,139 @@
>              section in the Toaster User Manual.
>          </para>
>      </section>
> +
> +    <section id=3D'setting-up-to-use-wsl'>
> +        <title>Setting Up to Use Windows Subsystem For Linux (WSLv2)</ti=
tle>
> +
> +        <para>
> +            With <ulink url=3D'https://docs.microsoft.com/en-us/windows/=
wsl/wsl2-about'>
> +            Windows Subsystem for Linux (WSLv2)</ulink>, you can create =
a
> +            Yocto Project development environment that allows you to bui=
ld
> +            on Windows. You can set up a Linux distribution inside Windo=
ws
> +            in which you can develop using the Yocto Project.
> +        </para>
> +
> +        <para>
> +            Follow these general steps to prepare a Windows machine usin=
g WSLv2
> +            as your Yocto Project build host:
> +            <orderedlist>
> +                <listitem><para>
> +                    <emphasis>Make sure your Windows 10 machine is capab=
le of running WSLv2:</emphasis>
> +
> +                    WSLv2 is only available for Windows 10 builds > 1891=
7. To
> +                    check which build version you are running, you may o=
pen a
> +                    command prompt on Windows and execute the command "v=
er".
> +                    <literallayout class=3D'monospaced'>
> +    C:\Users\myuser> ver
> +
> +    Microsoft Windows [Version 10.0.19041.153]
> +                    </literallayout>
> +                    If your build is capable of running WSLv2 you may co=
ntinue,
> +                    for more information on this subject or instructions=
 on how
> +                    to upgrade to WSLv2 visit <ulink url=3D'https://docs=
.microsoft.com/en-us/windows/wsl/wsl2-install'>Windows 10 WSLv2</ulink>
> +                    </para></listitem>
> +                <listitem><para>
> +                    <emphasis>Install the Linux distribution of your cho=
ice inside Windows 10:</emphasis>
> +                    Once you know your version of Windows 10 supports WS=
Lv2,
> +                    you can install the distribution of your choice from=
 the
> +                    Microsoft Store.
> +                    Open the Microsoft Store and search for Linux. While=
 there
> +                    are several Linux distributions available, the assum=
ption
> +                    is that your pick will be one of the distributions s=
upported
> +                    by the Yocto Project as stated on the instructions f=
or
> +                    using a native Linux host.
> +                    After making your selection, simply click "Get" to d=
ownload
> +                    and install the distribution.
> +                    </para></listitem>
> +                <listitem><para>
> +                    <emphasis>Check your Linux distribution is using WSL=
v2:</emphasis>
> +                    Open a Windows PowerShell and run:
> +                    <literallayout class=3D'monospaced'>
> +    C:\WINDOWS\system32> wsl -l -v
> +    NAME      STATE           VERSION
> +    *Ubuntu    Running         2
> +                    </literallayout>
> +                    Note the version column which says the WSL version b=
eing used by
> +                    your distribution, on compatible systems, this can b=
e changed back
> +                    at any point in time.
> +                    </para></listitem>
> +                <listitem><para>
> +                    <emphasis>Optionally Orient Yourself on WSL:</emphas=
is>
> +                    If you are unfamiliar with WSL, you can learn more h=
ere -
> +                    <ulink url=3D'https://docs.microsoft.com/en-us/windo=
ws/wsl/wsl2-about'></ulink>.
> +                    </para></listitem>
> +                <listitem><para>
> +                    <emphasis>Launch your WSL Distibution:</emphasis>
> +                    From the Windows start menu simply launch your WSL d=
istribution
> +                    just like any other application.
> +                    </para></listitem>
> +                <listitem><para>
> +                    <emphasis>Optimize your WSLv2 storage often:</emphas=
is>
> +                    Due to the way storage is handled on WSLv2, the stor=
age
> +                    space used by the undelying Linux distribution is no=
t
> +                    reflected immedately, and since bitbake heavily uses
> +                    storage, after several builds, you may be unaware yo=
u
> +                    are running out of space. WSLv2 uses a VHDX file for
> +                    storage, this issue can be easily avoided by manuall=
y
> +                    optimizing this file often, this can be done in the
> +                    following way:
> +                    <orderedlist>
> +                        <listitem><para>
> +                            <emphasis>Find the location of your VHDX fil=
e:</emphasis>
> +                            First you need to find the distro app packag=
e directory,
> +                            to achieve this open a Windows Powershell as=
 Administrator
> +                            and run:
> +                            <literallayout class=3D'monospaced'>
> +    C:\WINDOWS\system32> Get-AppxPackage -Name "*Ubuntu*" | Select Packa=
geFamilyName
> +    PackageFamilyName
> +    -----------------
> +    CanonicalGroupLimited.UbuntuonWindows_79abcdefgh
> +                            </literallayout>
> +                            You should now replace the <replaceable>Pack=
ageFamilyName</replaceable>
> +                            and your <replaceable>user</replaceable> on =
the following
> +                            path to find your VHDX file: <filename>C:\Us=
ers\user\AppData\Local\Packages\PackageFamilyName\LocalState\</filename>
> +                            For example:
> +                            <literallayout class=3D'monospaced'>
> +    ls C:\Users\myuser\AppData\Local\Packages\CanonicalGroupLimited.Ubun=
tuonWindows_79abcdefgh\LocalState\
> +    Mode                 LastWriteTime         Length Name
> +    -a----         3/14/2020   9:52 PM    57418973184 ext4.vhdx
> +                            </literallayout>
> +                            Your VHDX file path is: <filename>C:\Users\m=
yuser\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79abcdef=
gh\LocalState\ext4.vhdx</filename>
> +                            </para></listitem>
> +                        <listitem><para><emphasis>Optimize your VHDX fil=
e:</emphasis>
> +                            Open a Windows Powershell as Administrator t=
o optimize
> +                            your VHDX file, shutting down WSL first:
> +                            <literallayout class=3D'monospaced'>
> +    C:\WINDOWS\system32> wsl --shutdown
> +    C:\WINDOWS\system32> optimize-vhd -Path C:\Users\myuser\AppData\Loca=
l\Packages\CanonicalGroupLimited.UbuntuonWindows_79abcdefgh\LocalState\ext4=
.vhdx -Mode full
> +                            </literallayout>
> +                            A progress bar should be shown while optimiz=
ing the VHDX file,
> +                            and storage should now be reflected correctl=
y on the Windows
> +                            Explorer.
> +                            </para></listitem>
> +                    </orderedlist>
> +                </para></listitem>
> +            </orderedlist>
> +            <note>
> +              The current implementation of WSLv2 does not have out-of-t=
he-box
> +              access to external devices such as those connected through=
 a
> +              USB port, but it automatically mounts your <filename>C:</f=
ilename>
> +              drive on <filename>/mnt/c/</filename> (and others), which
> +              you can use to share deploy artifacts to be later flashed =
on
> +              hardware through Windows, but your build directory should =
not
> +              reside inside this mountpoint.
> +            </note>
> +            Once you have WSLv2 set up, everything is in place to
> +            develop just as if you were running on a native Linux machin=
e.
> +            If you are going to use the Extensible SDK container, see th=
e
> +            "<ulink url=3D'&YOCTO_DOCS_SDK_URL;#sdk-extensible'>Using th=
e Extensible SDK</ulink>"
> +            Chapter in the Yocto Project Application Development and the
> +            Extensible Software Development Kit (eSDK) manual.
> +            If you are going to use the Toaster container, see the
> +            "<ulink url=3D'&YOCTO_DOCS_TOAST_URL;#toaster-manual-setup-a=
nd-use'>Setting Up and Using Toaster</ulink>"
> +            section in the Toaster User Manual.
> +        </para>
> +    </section>
>  </section>
>=20
>  <section id=3D'locating-yocto-project-source-files'>
> --
> 2.17.1

