Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50842.1795425809084038478
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Nov 2026 01:23:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ov60nUAy;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B288AC69146
	for <docs@lists.yoctoproject.org>; Mon, 23 Nov 2026 09:23:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C0FB15FAEB;
	Mon, 23 Nov 2026 09:23:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3065411E688A3;
	Mon, 23 Nov 2026 10:23:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795425806; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nHMYZIPybmBHrUxE4BJsJGnH7zn6UpMDJyAtJlpBCwM=;
	b=ov60nUAyz5LUIi3wqhgbKvE7067F9aiDhIKNIQ8PAyNy+lhf3XJpoiJ92KBc4BLTJtPerR
	FHR1D5J7RWjcPda4qnYM+PR0+NNVIlJTLiOTPBcNFzs6IjwiKgywsZaIpbHwBPLUvUrYq0
	5RIERyIXUhu90Ij7wBEbd2nSVor5CQa4SWmf9peCUQ100PTQqwD4pu6d8Ss8gv1cIW1ST9
	4UwTYr72pdg5ORlfhVlrT/0HEppnZFeseOiZBpVihohDMLWYrzUaVCtwyd1M6TE4jY66IH
	6tNLRGS1o1bcs22mVTzWjjXgW9IxzG9FjIaoG5+L4p7wsKW6LxEIDxcdXU+p1g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 10:23:24 +0100
Message-Id: <DN2HBVV40XL7.1X0R6JHGXNE1V@bootlin.com>
Subject: Re: [docs] [PATCH 3/8] conf.py: enable the sphinx-tags extension
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
References: <20261028-tags-v1-0-d5ad01019eae@bootlin.com>
 <20261028-tags-v1-3-d5ad01019eae@bootlin.com>
 <b2f3e59f-32c9-4039-aad4-e9218e8d669a@cherry.de>
 <DN2GLFQMAK3A.ZD9E1I8PU6JV@bootlin.com>
In-Reply-To: <DN2GLFQMAK3A.ZD9E1I8PU6JV@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Mon, 23 Nov 2026 09:23:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10825

Hi,

On Mon Nov 23, 2026 at 9:48 AM CET, Antonin Godard wrote:
> Hi,
>
> On Fri Nov 20, 2026 at 6:31 PM CET, Quentin Schulz via docs wrote:
> [...]
>> suggestion: set tags_output_dir to $(BUILDDIR) (maybe /_tags also?)
>>
>> This should allow us to avoid having to update our Makefile and=20
>> .gitignore? It's also where we put build artifacts so it makes much more=
=20
>> sense IMO.
>
> Makes sense, I'll try moving the directory there

Hm, we can't do that because the _tags/ directory contains rST files (gener=
ated
by the extension), and we need Sphinx to be able to locate them. However, w=
e have:

exclude_patterns =3D ['_build', 'Thumbs.db', '.DS_Store', 'boilerplate.rst'=
]

so Sphinx could ever match these files if they were in _build/. And
exclude_patterns can only contain glob-style pattern, and takes priority ov=
er
include_patterns.

Antonin
