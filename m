Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B873CCDB471
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 08:23:40 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38537.1782116612209788618
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Jun 2026 01:23:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=AtYgWzVJ;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D2427C62209
	for <docs@lists.yoctoproject.org>; Mon, 22 Jun 2026 08:23:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C7712601BB;
	Mon, 22 Jun 2026 08:23:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8B857106C8996;
	Mon, 22 Jun 2026 10:23:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782116609; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KtxEOQzKT5QpyF6EfAmbJmFsKeuP69DKQ6N1aH2CDjM=;
	b=AtYgWzVJXSd26Jj0kBbPtHcT9e041nKCDaNZH++eQSTUpGLrW1dYDbqc1WL2YxCjpCvZCb
	/Nb6hlO0XvASA8FiRyK1xGNtW0fpLm2Qy9gfPIMPySszBihKw3v7CPyBK2kLUZY5YcP108
	Y4eKa9iqnkY0jVabDh5emAt/suBlareGfJ111rdjL58kvVbF9wzEwIwdVZkbBYQbaHQtm/
	nAnjjlZeA8NdpqTizdKbG255w0ERONQZmUSWThcqrTVmpwQw2nfceEyiXyu4QyBbfspk3v
	6EV2reyrfEbTKA9Eg+Xie3BmxN9srdIUge1L1/freebiln35gax8IhITtaoucQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Jun 2026 10:23:27 +0200
Message-Id: <DJFFM3EIMKID.1C8YEFR1DJ2VD@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: small number of grammar/punctuation
 changes
References: <1f016852-03ef-1792-c8ae-54d04f1c59ab@crashcourse.ca>
In-Reply-To: <1f016852-03ef-1792-c8ae-54d04f1c59ab@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 22 Jun 2026 08:23:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9820

Hi,

I can't apply the patch, it seems broken:

  Applying: ref-manual: small number of grammar/punctuation changes
  Using index info to reconstruct a base tree...
  error: patch failed: documentation/ref-manual/yocto-project-supported-fea=
tures.rst:158
  error: documentation/ref-manual/yocto-project-supported-features.rst: pat=
ch does not apply
  error: Did you hand edit your patch?
  It does not apply to blobs recorded in its index.
  Patch failed at 0001 ref-manual: small number of grammar/punctuation chan=
ges

Can you look into it?

Antonin


