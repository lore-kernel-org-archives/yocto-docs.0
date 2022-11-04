Return-Path: <glscene2010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC100C433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 03:23:17 +0000 (UTC)
Subject: Re: YP Quick Build: errors/annoyances: ubu-22.04 docker container
To: docs@lists.yoctoproject.org
From: glscene2010@gmail.com
X-Originating-Location: Seongnam-si, Gyeonggi-do, KR (211.250.88.134)
X-Originating-Platform: Linux Firefox 106
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 03 Nov 2022 20:23:09 -0700
References: <2fd29235-6c93-a911-944a-f78dd7a27904@windriver.com>
In-Reply-To: <2fd29235-6c93-a911-944a-f78dd7a27904@windriver.com>
Message-ID: <17126.1667532189686240195@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="h2uAucCGEG5E5YfXvmAo"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 04 Nov 2022 03:23:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3458

--h2uAucCGEG5E5YfXvmAo
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 13, 2022 at 01:05 AM, Randy MacLeod wrote:

>=20
> pylint3

I read doc ( https://docs.yoctoproject.org/ref-manual/system-requirements.h=
tml#required-packages-for-the-build-host ) it contains
1.1 Supported Linux Distributions=EF=83=81
Currently, the Yocto Project is supported on the following distributions:
...
Ubuntu 22.04 (LTS)

And for Ubuntu/Debian doc contains
sudo apt install gawk wget git diffstat unzip texinfo gcc build-essential c=
hrpath socat cpio python3 python3-pip python3-pexpect xz-utils debianutils =
iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev pylint3 =
xterm python3-subunit mesa-common-dev zstd liblz4-tool I use Ubuntu 22. I g=
et "E: Unable to locate package pylint3". As i know there is no package ( h=
ttps://packages.ubuntu.com/search?keywords=3Dpylint3 ) pylint3 on Ubuntu 22=
. YP needs fix doc. It is not normal that user get error on supported OS, i=
sn't it? I am sorry, I am new and I use github before. So I don't know how =
add commit for YP doc.

--h2uAucCGEG5E5YfXvmAo
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 13, 2022 at 01:05 AM, Randy MacLeod wrote:<br />
<blockquote>pylint3</blockquote>
I read <a href=3D"https://docs.yoctoproject.org/ref-manual/system-requireme=
nts.html#required-packages-for-the-build-host" target=3D"_blank" rel=3D"noo=
pener">doc</a> it contains <br /><em>1.1 Supported Linux Distributions=EF=
=83=81</em><br /><em>Currently, the Yocto Project is supported on the follo=
wing distributions:</em><br /><em>...</em><br /><em>&nbsp;&nbsp;&nbsp; Ubun=
tu 22.04 (LTS)</em><br /><br />And for Ubuntu/Debian doc contains<br />
<pre>sudo apt install gawk wget git diffstat unzip texinfo gcc build-essent=
ial chrpath socat cpio python3 python3-pip python3-pexpect xz-utils debianu=
tils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev pyl=
int3 xterm python3-subunit mesa-common-dev zstd liblz4-tool</pre>
I use Ubuntu 22. I get "E: Unable to locate package pylint3". As i know the=
re is <a href=3D"https://packages.ubuntu.com/search?keywords=3Dpylint3" tar=
get=3D"_blank" rel=3D"noopener">no package</a> pylint3 on Ubuntu 22. YP nee=
ds fix doc. It is not normal that user get error on supported OS, isn't it?=
 I am sorry, I am new and I use github before. So I don't know how add comm=
it for YP doc.

--h2uAucCGEG5E5YfXvmAo--

