Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E6ECD6E57
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 15:29:40 +0000 (UTC)
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22917.1780500578484587412
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Jun 2026 08:29:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=F915EkD0;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=C3/EgS8q;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.156, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B6DBB7A00A4;
	Wed,  3 Jun 2026 11:29:37 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Wed, 03 Jun 2026 11:29:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1780500577;
	 x=1780586977; bh=JPtV/VX3aKHBWW0CBgn7TTiOs9uqtvxTtrIE0Gzu+xg=; b=
	F915EkD0e0QzZ1FK5n+XgUeHtjA1i/SnpNtCwK47euD9L/CEehmh49C1QjrhRXGT
	nb8BBCdfWU5mJNQ0sJZdmiY4YXd9UFnmshJvDOJfBLTFU47EpV0vDeE1sUQoHXsW
	eKjRo6tPjq0qGWxwY7N/HGPZaPC+3knOeLaea+A70NoHJXE2yo0JdDqmtdtdqyVD
	Qyw8KlIQdEyqzjPVx4wsnATiiE+HgWBUE5bb15c/5m3jHgGlpX5vGvEVnUlXofmi
	NqXvbSLYeCO1cT7vAzXcAWnfTjL8OwOb/ewO1dbXtQh4ssb8r/hI5SQRB99wc396
	sGFZ2MLyovJ2dk40He6Big==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1780500577; x=
	1780586977; bh=JPtV/VX3aKHBWW0CBgn7TTiOs9uqtvxTtrIE0Gzu+xg=; b=C
	3/EgS8qXXPkeZDgZbnBx56UgITWIsE9N7l3KsDQXubyhZQQNTcQZt2AJzkfGOuMs
	kxzDVdrFmpqjsw/dD/tUZgIhJ8L2YbKE+G2dSeZznUSp3ZDYdhH2VuvHL0/WAmsZ
	c5X2Kggvx2a9gJaDbKsHooQ0M+wVSvdAV5lw26xjDyNSaNSLm7qq9Aecsm+3isAb
	si7lUaROcklGxm/M01CmPBlTMvMocgKqf91myRa19hNCMbTgWqjiqXuy9mrCgJat
	jrQ3Loj/mjFRPMeYd6ZBosbqJZayk71mcgOmNuZ8DTAYlcUjMCOfAaQTd0v2BP8q
	PsahoxywagD3jlwSE7FJQ==
X-ME-Sender: <xms:YUgganvn4Zyj7z87YqxcTZUr3LVQ0HpdSpMny6OPNrjFAQebGVpVuQ>
    <xme:YUggauewH6pi-51qMkXc6nsl3csCtQOvmfBAaoetzK1W0jHYhCIIedYVvGfRIrbB_
    Yx9Rxy7JRaKtD99sSLfK_ufX-2DXDKMAPfR-FKt2OWyvxyp3f7A_aY>
X-ME-Received: <xmr:YUggaobSqoPN4tdlzYrNFAcZjho4QNDXOKwJipjZCBHYjC_VV9oXRY3vPd9XV7r3ImotrSxEe3JO2Z91L16AMiMxynnnS8Y>
X-ME-Proxy-Cause: dmFkZTFu9AyWWPiHTL//GUxyfVBwl5gEbJWmMMyh5filr06YLdcATRD45d8vpDQVHb4qnW
    Ybt1f8P7SCZuxV0TSjsAwpQnPD1IL+5zmPU9AG2K7sY+xc+46oOGxyQtDrK/VYNTd9podh
    XmIYvQu+oBzt8hivHKgVy6Og8K/jMAPKMoLcRfZHLi1kLYRMgkyVkdaA16U07+cRozuOjr
    McOEu8JMNF8ph93TUr+beakcUrX0m7qau+qnMkoqO/zvBtXUrMhj//aLgW7k8/claATP0J
    dlyaXoU70Ot8QcadOcge119C8Ot7k1FbkSyOKxSek7lyf54Wuguc5N92W0hHwDGlm6tMc/
    LdBFkMHDLRc9v4zM3pWS0Ivz0/veTt+2o40KjWfRFfetu6Ne1yH+p8OwKh49D+4BM6ijay
    /7L/h7YkB+cg2tYTtm5H/+s1WZoRgTrJf9jP6K8ZkKee2L83e7sz5nXqlRkCuDIlGmEoDI
    uX7y4uLFADxU4Pl+V2xeMbTd1Kubl4cYvMzXnkbGSNneV/lfuk3ejXiPr+4bI0hPMv9Fxt
    T4CqJYJCwYsldvYsV21XOuyE/rj9B1Z5SgICbfBgHRiGLqXHkvc8u7YIQJEjM+3+h4YKpS
    y7aY3TrBFPdPgYPzZ2BBEHjBNFzB4cHwZMeA0liAAFi2IeCFeyw/GE44ejaA
X-ME-Proxy: <xmx:YUggahVQQvhOpxm6GWVHYRSbdAIn0cgpcJERb8PY38_-ZyB00rfEgg>
    <xmx:YUggaqh0UTumL4I4OxI3VDhah_XUNPvmRi-IN5iW5Lpv8sG4LgQq5w>
    <xmx:YUggavWG9Ujx9u_rKUN6l6G29f0p1CDDeMzbVD8u6OEVa_kDxHVlFg>
    <xmx:YUggahNHO2P9wXywlDCFyn2kQbLXLwEKbjr6StNszbW1B3gxB1LF3w>
    <xmx:YUggavQwx_HFj8h84KdT_jMHdCCIyPHvEtN_ckviy4YrDxqvGtIOsf3Q>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jun 2026 11:29:36 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Wed, 03 Jun 2026 16:29:23 +0100
Subject: [PATCH 2/2] security-team: Avoid redundant info & update Mitre
 link
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-sec-team-v1-2-ffb2e8965875@pbarker.dev>
References: <20260603-sec-team-v1-0-ffb2e8965875@pbarker.dev>
In-Reply-To: <20260603-sec-team-v1-0-ffb2e8965875@pbarker.dev>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2938; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=yFLNm24qI1YtC6GG6vwr2g3cdBnVygkrxM0X2eZTYFA=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWQpeMRWufNtyAzxUZyvHiaz/u6Euf806i/Wf6i6+OOQR
 2V21JONHaUsDGJcDLJiiiybe77ef9rryJsRcksBZg4rE8gQBi5OAZjIITWGP/wLv89ccPW5jrXH
 x6RTUp+va8/uzHq62bxD/OwTXj7HhPWMDIfnbjnTINQ6S+XcCtW0aXnmYkUSU0SqUubXdZ9gTZh
 fygMA
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 Jun 2026 15:29:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9565

The section "What Yocto Security Team does when it receives a security
vulnerability" duplicated information already found in the previous
section "Security Team Operations", so merge the sections and tidy up
the flow of the text.

While we're editing this, Mitre is now just one of the places you can go
to get a CVE assigned, many other CVE Numbering Authorities (CNAs) are
available. They also now have a web form for contact and requesting CVE
assignment so let's link directly to that.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 documentation/security-reference/security-team.rst | 24 +++++++---------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/documentation/security-reference/security-team.rst b/documentation/security-reference/security-team.rst
index f8fee56b73df..2963947262fd 100644
--- a/documentation/security-reference/security-team.rst
+++ b/documentation/security-reference/security-team.rst
@@ -56,28 +56,18 @@ original reporter in the loop. There is also sometimes some coordination for
 handling patches, backporting patches etc, or just understanding the problem
 or what caused it.
 
-When the fix is publicly available, the YP security team member or the
-package maintainer sends patches against the YP code base, following usual
-procedures, including public code review.
-
-What Yocto Security Team does when it receives a security vulnerability
-=======================================================================
-
-The YP Security Team team performs a quick analysis and would usually report
-the flaw to the upstream project. Normally the upstream project analyzes the
-problem. If they deem it a real security problem in their software, they
-develop and release a fix following their own security policy. They may want
-to include the original reporter in the loop. There is also sometimes some
-coordination for handling patches, backporting patches etc, or just
-understanding the problem or what caused it.
-
 The security policy of the upstream project might include a notification to
 Linux distributions or other important downstream projects in advance to
 discuss coordinated disclosure. These mailing lists are normally non-public.
 
 When the upstream project releases a version with the fix, they are responsible
-for contacting `Mitre <https://www.cve.org/>`__ to get a CVE number assigned and
-the CVE record published.
+for contacting an appropriate CVE Numbering Authority (CNA), such as `Mitre
+<https://cveform.mitre.org/>`__, to get a CVE number assigned and the CVE
+record published.
+
+When the fix is publicly available, the YP security team member or the
+package maintainer sends patches against the YP code base, following usual
+procedures, including public code review.
 
 If an upstream project does not respond quickly
 ===============================================

-- 
2.43.0


