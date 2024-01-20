Return-Path: <mhagans@skyviewsat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3FECC47258
	for <webhook@archiver.kernel.org>; Sat, 20 Jan 2024 17:52:57 +0000 (UTC)
Subject: installing documentation per the Reference manual section 1.4.1
To: docs@lists.yoctoproject.org
From: mhagans@skyviewsat.com
X-Originating-Location: Rainsville, Alabama, US (137.119.15.248)
X-Originating-Platform: Linux Firefox 115
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 20 Jan 2024 09:52:49 -0800
Message-ID: <qBwK.1705773169837336808.wBv6@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="FD0CY5kHUpUYi3TjE28y"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 20 Jan 2024 17:52:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4787

--FD0CY5kHUpUYi3TjE28y
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi all - new to Yocto, going through the process of making my Build Host.=
=C2=A0 My Build Host hardware is Lenovo Thinkpad X1 carbon (4th gen) with i=
ntel i7 processor, running Debian GNU/Linux 12.
The instructions for building the Project Documentation manuals in 1.4.1 (D=
ebian and Ubuntu) says:

Here are the packages needed to build Project documentation manuals:

$ sudo apt install make python3-pip inkscape texlive-latex-extra
$ sudo pip3 install sphinx sphinx_rtd_theme pyyaml

the first install string ran successfully, but the second one gave me the f=
ollowing error, and I don't know how to proceed.
mike@X1CARBON:~$ sudo pip3 install sphinx sphinx_rtd_theme pyyaml
>=20
> error: externally-managed-environment=C3=97 This environment is externall=
y
> managed=E2=95=B0=E2=94=80> To install Python packages system-wide, try ap=
t install=C2=A0=C2=A0=C2=A0
> python3-xyz, where xyz is the package you are trying to=C2=A0=C2=A0=C2=A0=
 install.=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0
> If you wish to install a non-Debian-packaged Python package,=C2=A0=C2=A0=
=C2=A0 create a
> virtual environment using python3 -m venv path/to/venv.=C2=A0=C2=A0=C2=A0=
 Then use
> path/to/venv/bin/python and path/to/venv/bin/pip. Make=C2=A0=C2=A0=C2=A0 =
sure you have
> python3-full installed.=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 If you wish =
to install a non-Debian
> packaged Python application,=C2=A0=C2=A0=C2=A0 it may be easiest to use p=
ipx install xyz,
> which will manage a=C2=A0=C2=A0=C2=A0 virtual environment for you. Make s=
ure you have
> pipx installed.=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 See /usr/share/doc/p=
ython3.11/README.venv for more
> information.note: If you believe this is a mistake, please contact your
> Python installation or OS distribution provider. You can override this, a=
t
> the risk of breaking your Python installation or OS, by passing
> --break-system-packages.hint: See PEP 668 for the detailed specification.

Do I override with --break-system or?

TIA,
Mike

--FD0CY5kHUpUYi3TjE28y
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi all - new to Yocto, going through the process of making my Build Host.&n=
bsp; My Build Host hardware is Lenovo Thinkpad X1 carbon (4th gen) with int=
el i7 processor, running Debian GNU/Linux 12.<br />The instructions for bui=
lding the Project Documentation manuals in 1.4.1 (Debian and Ubuntu) says:<=
br />
<p>Here are the packages needed to build Project documentation manuals:</p>
<div class=3D"highlight-default notranslate">
<div class=3D"highlight">
<pre><span></span>$ sudo apt install make python3-pip inkscape texlive-late=
x-extra
$ sudo pip3 install sphinx sphinx_rtd_theme pyyaml
</pre>
</div>
</div>
the first install string ran successfully, but the second one gave me the f=
ollowing error, and I don't know how to proceed.<br />mike@X1CARBON:~$ sudo=
 pip3 install sphinx sphinx_rtd_theme pyyaml
<blockquote>error: externally-managed-environment&times; This environment i=
s externally managed=E2=95=B0=E2=94=80&gt; To install Python packages syste=
m-wide, try apt install&nbsp;&nbsp;&nbsp; python3-xyz, where xyz is the pac=
kage you are trying to&nbsp;&nbsp;&nbsp; install.&nbsp;&nbsp; &nbsp;&nbsp;&=
nbsp;&nbsp; If you wish to install a non-Debian-packaged Python package,&nb=
sp;&nbsp;&nbsp; create a virtual environment using python3 -m venv path/to/=
venv.&nbsp;&nbsp;&nbsp; Then use path/to/venv/bin/python and path/to/venv/b=
in/pip. Make&nbsp;&nbsp;&nbsp; sure you have python3-full installed.&nbsp;&=
nbsp; &nbsp;&nbsp;&nbsp;&nbsp; If you wish to install a non-Debian packaged=
 Python application,&nbsp;&nbsp;&nbsp; it may be easiest to use pipx instal=
l xyz, which will manage a&nbsp;&nbsp;&nbsp; virtual environment for you. M=
ake sure you have pipx installed.&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; See =
/usr/share/doc/python3.11/README.venv for more information.note: If you bel=
ieve this is a mistake, please contact your Python installation or OS distr=
ibution provider. You can override this, at the risk of breaking your Pytho=
n installation or OS, by passing --break-system-packages.hint: See PEP 668 =
for the detailed specification.</blockquote>
Do I override with --break-system or?<br /><br />TIA,<br />Mike<br />

--FD0CY5kHUpUYi3TjE28y--

