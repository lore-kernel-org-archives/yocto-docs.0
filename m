Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BF12CE8D70
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 18:11:26 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4816.1763143885743296445
 for <docs@lists.yoctoproject.org>;
 Fri, 14 Nov 2025 10:11:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HRIy+LJ0;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-882390f7952so22295606d6.3
        for <docs@lists.yoctoproject.org>; Fri, 14 Nov 2025 10:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763143885; x=1763748685; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mUilp21PJXxBHb8m2jLtCrIGI3xNjtcQVkW01LTOw6Y=;
        b=HRIy+LJ0Bo90nZDz9pYLwAJUcJ+tRJhKC/300ll1FYqeKKLR+UevYMoPDEli01TLOq
         IBAfzvDGqT/eOZU3Fz8VE5I326q5NIOc1LC0NP+BMcm+YYyrG/7h+Iipg1WTe5PqYSVF
         DziRNKVfSor7ak4kzY3mfOhrmtyZw0wz0cnIOttGwT2e1euXzMcREHsnJd+46ymOXyXI
         Qm3LtPOJz362yMd1SxXMtnX6kcUflvIc60nqU1FL3uQ3oBc3sPYKL3ULhkF2AGJcJ761
         yzoX+J9lNzLL/OFvXQxl9wwPoWNTRBA13TyRv/HbfmazReCpj15dXPVb4s8pB8QDGhmi
         YPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763143885; x=1763748685;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mUilp21PJXxBHb8m2jLtCrIGI3xNjtcQVkW01LTOw6Y=;
        b=l0gqXSsSUL+eWClSPLNnXnR3FMUat9douAHFbv36OTXBCfYzc069aA50j+iOEl6gE/
         MESmPbX85vNCSuJnJ6JjJM93mkDgdruHcg9IL4wXMAHcadOP6ytUqt7pNGRoDAXsRzZn
         2Sa4JoIho2kb4gQs5nJb/vU0BLkVh8Sx7/VpyQ47mVSiLnDk6kXS/STWqEllFndC6k8F
         oMevl38WG5kTOOCpZMXNyKzT901Fkb1N5Z52R+19r0tS7U4N409KKSwwG45qSZKZ/tIq
         3VQQLJy6ckJcHXwzl/3zu4USB1fgGvJsUpOrMAe+Q+KIqS+aICYGgA1MRhD8YXyDLJh6
         kuzw==
X-Forwarded-Encrypted: i=1; AJvYcCV5Ras3P+THi+I7LhlwmZtRYYK6gdUL02dCUetZd8gqQLStzIRsl+uUnoAh5aGdBWhE4cJj@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yw722sxw+7i65HFwIprr6tAIm3eRolpcRz7gx6kfrlNtnRPZIQK
	Hgtb0AC2ay4avQ8X4zUY2lZZVZLf23X3ULfiJ4A8YQkTXhVh6q4uEpmNDybZ7wZqCS0mUgMWvOl
	rVwHyEecERNc+eJ2pTxInKKBXSq+4j/4=
X-Gm-Gg: ASbGncvlaFrdwRUgJ5Xh+lUhU57U89K5+JcNyMGRJYMdzYT53KvY32EcYhOYN7YY+ka
	/57FtKEdUEUK2HAjHqcSW6dYU6YfTWfeXm2VPFDVFutRwd4Lg4YXIHzq9ix95F13x8owuS0sZli
	y+BfP2g586wZMs6JkI8Eopumy8G2BrLdYqfzb8yq710O75rX+m8uLxJpaFGlCiqa0sIBCVhzP6J
	r4vwRoOdxv0rUlnd/fs9e1J4jC4TkKhgoFIU4Mix7BIXQEXF9tADUxWwV2p0/9Fi92JzA==
X-Google-Smtp-Source: AGHT+IGDwOvYhFMLnCGVym0Vu3QFUo2gDQ6XDZFiFI0UmkvNjV/aHYO5wBD725Db/ac6zEUP3J6lNERO5unrteNdfVc=
X-Received: by 2002:a05:6214:c43:b0:880:501f:5cd with SMTP id
 6a1803df08f44-882925c5665mr52349086d6.2.1763143884622; Fri, 14 Nov 2025
 10:11:24 -0800 (PST)
MIME-Version: 1.0
References: <20251114-update-bbsetup-doc-v1-0-044070bdffec@bootlin.com> <20251114-update-bbsetup-doc-v1-1-044070bdffec@bootlin.com>
In-Reply-To: <20251114-update-bbsetup-doc-v1-1-044070bdffec@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 14 Nov 2025 19:11:13 +0100
X-Gm-Features: AWmQ_bnXxYJxuCs-uGzSJ_bvVcD85L_KOU0N0aEq1XVVxo1zuD51mnvjMY911nM
Message-ID: <CANNYZj8jeGq8Hq87a=ha7wfb8_ra3D3v5RJseQR8ee9yyPu7bw@mail.gmail.com>
Subject: Re: [bitbake-devel] [PATCH 1/3] doc/bitbake-setup: show how to clone
 bitbake before using bitbake-setup
To: antonin.godard@bootlin.com
Cc: bitbake-devel@lists.openembedded.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 14 Nov 2025 18:11:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8053

On Fri, 14 Nov 2025 at 12:12, Antonin Godard via
lists.openembedded.org
<antonin.godard=bootlin.com@lists.openembedded.org> wrote:
> -#. ``bitbake-setup`` is part of the BitBake repository under
> -   ``./bin/bitbake-setup``. To start, run:
> +#. If you haven't already, clone the BitBake repository:
>
>     .. code-block:: shell
>
> -      $ ./bin/bitbake-setup init
> +      $ git clone https://git.openembedded.org/bitbake

Add a note here: bitbake-setup is not coupled to the openembedded or
yocto releases that it is setting up, and generally a copy from
bitbake master should be used as it aims to be backwards compatible,
and yet have the fullest set of features.

Alex

