Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E550CCA470
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 06:33:26 +0000 (UTC)
Subject: Re: [PATCH 5/5] sphinx-static/switchers.js.in: do not refer to URL_ROOT anymore
To: docs@lists.yoctoproject.org
From: "Gyorgy Sarvari" <skandigraun@gmail.com>
X-Originating-Location: Zurich, CH (51.154.145.205)
X-Originating-Platform: Linux Firefox 143
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 05 Oct 2025 23:33:16 -0700
References: <20241106-pdf-xetex-v1-5-044eab7e77d3@bootlin.com>
In-Reply-To: <20241106-pdf-xetex-v1-5-044eab7e77d3@bootlin.com>
Message-ID: <3495.1759732396707921762@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="pGvSSePGgCVQpvlJlX81"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Oct 2025 06:33:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7644

--pGvSSePGgCVQpvlJlX81
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

It looks like that this patch got merged a while ago, but it seems that it =
is not online - at least not for Bitbake documentation. The top switcher is=
 complaining that ' can't access property "match", root is undefined' , and=
 when i inspect the issue, this commit seems to be missing from the js.

--pGvSSePGgCVQpvlJlX81
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>It looks like that this patch got merged a while ago, but it seems tha=
t it is not online - at least not for Bitbake documentation. The top switch=
er is complaining that '<span class=3D"message-body-wrapper"><span class=3D=
"message-flex-body"><span class=3D"message-body devtools-monospace"><span d=
ata-link-actor-id=3D"server0.conn2.watcher2.process816//obj29" class=3D"obj=
ectBox-stackTrace reps-custom-format"><span class=3D"objectBox objectBox-st=
ring">can't access property "match", root is undefined'</span></span></span=
></span></span>, and when i inspect the issue, this commit seems to be miss=
ing from the js.</div>

--pGvSSePGgCVQpvlJlX81--

