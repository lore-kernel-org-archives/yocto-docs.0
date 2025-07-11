Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AFE1C83F1A
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 17:14:29 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.19180.1752254059656453697
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Jul 2025 10:14:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KleRlVq4;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6fd0a91ae98so15454026d6.1
        for <docs@lists.yoctoproject.org>; Fri, 11 Jul 2025 10:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752254059; x=1752858859; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=53QHQd/qJGhLOJydD+llHa/jA/ejyMO4habelP6vPVI=;
        b=KleRlVq4tSrFGhm5A17DT7+Bkk3mdtyg1fxInnpyzNLL11atPpiMx86BAjFz7Xlfqa
         5H9nVstvLMs7tuqQNIuuPsy8d60asJxa7SuuqtAeYJrwOJ4+sEw1Y5i5XPrLlfwqgfGL
         tL1WhrIpLTstyFtDgkJVwO58+YTXLTYRriNp4cGPDhk4JzPfnGcq+HZrJwIIelvi/jN0
         Lg4RASurt2PRSlt7GkriYKjT6okAA/DyHoEzXHKf9uIcpA1nPFt86mPpaW+batl7qTSY
         kA1lFVRULlcAyve9DtYflHXeDjk30aHl7UT2iH/sUmDMZc7RDnUPYRdK+7zxg3/JoB3X
         orJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752254059; x=1752858859;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=53QHQd/qJGhLOJydD+llHa/jA/ejyMO4habelP6vPVI=;
        b=qLQk0zgn9kLCFkiCuwSyXbO9YCzqyUVnJ7gYfn9Arv85jdjFsyivrLg5fPhxqhs+FL
         s/JlYC8zkw52oISpw9qwg9sSOYh9GNUTaHgQKB1diw8X0TNN8YF9cSQnFMXd0ALKTsRG
         hYDC4tjBg6p8wTB/fBWG06MpWav7UPfw0udCo4LNccUMaV9BYs1tZfvnnBKdMUbCYmSW
         wnIXzpdlEHbJpaX1lDm6zjRZAMwfCMMSNyb9h7Df51fur2Nb4FAPIK6Nq+xsJ+QnU5dJ
         izzO/qygf4bXi2tOB6Pg2wqDYzf4EsbR2RszgqEWAmKHtu6YLVbG3o4w5hrc1L03Owub
         neZA==
X-Gm-Message-State: AOJu0YxfVuxouIqEF4j5xMyXiyWfrS0DFt49bmcZULsfXTksUYWkOWKW
	SbGdEqjuiGTXJ4MJbHVgcejD+Ltv9aj42HN7fwSJx+feK37sfqjtdzyHriC32oeDnwBmS3UnQ+M
	bl4SSFZh2LmlJSncoJ6U8jeI1K2JqeUUqDw==
X-Gm-Gg: ASbGncvjyN3oDyZMhje6zz75Dh2FmZAgvBUpRmM7yDFnikgp4UXIGOQ6nrSccdp2/NX
	Lx9kGmN5i2enSehN731+zJv4/T47IIXp1fuBHpFx0yIuKQLTMg2qyzYCgthAcZJhApS2zJsLGCw
	SJOK78R1XuIaMB+/H9hmRDef3BBELdJVgBr+QBciVCIz8jjfZUSLZ0MkqQR6psPkSzBB/JedhLb
	j3B/QDwOhiNY1aDByxQcNbRmRwFboitD5VD4wQ=
X-Google-Smtp-Source: AGHT+IHJNUcF/tG1LgrselzMHqSAqdvcLDAbfy/XaDnqZIzi6f6CdQ9ftGVyB9IULJ9ZHa6bwVwuKFTUA9vEiqjdJPA=
X-Received: by 2002:ad4:5c6e:0:b0:704:9a2a:eb2d with SMTP id
 6a1803df08f44-704a40dce97mr71604146d6.19.1752254058510; Fri, 11 Jul 2025
 10:14:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250709-update-sstate-dir-docs-v1-0-9114688f33d1@bootlin.com> <20250709-update-sstate-dir-docs-v1-4-9114688f33d1@bootlin.com>
In-Reply-To: <20250709-update-sstate-dir-docs-v1-4-9114688f33d1@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 11 Jul 2025 19:14:06 +0200
X-Gm-Features: Ac12FXwhnMvtDDIHkR3HKbD7HSQVKzJ1KYmuGsRUk2oYQAZWMZCQ6BFKAZXeI4U
Message-ID: <CANNYZj_a_wXDDdcHzuz_oqxzOneQMYLYnz3VqNpRbfPNKX-zfQ@mail.gmail.com>
Subject: Re: [docs] [PATCH 4/4] overview-manual/concepts.rst: mention
 PERSISTENT_DIR for user configuration
To: antonin.godard@bootlin.com
Cc: docs@lists.yoctoproject.org, 
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Jul 2025 17:14:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7318

On Wed, 9 Jul 2025 at 09:57, Antonin Godard via lists.yoctoproject.org
<antonin.godard=bootlin.com@lists.yoctoproject.org> wrote:
> The PERSISTENT_DIR directory can also be customized to be shared, so
> mention it in the list of configuration variables in local.conf.

No. PESISTENT_DIR should never ever be shared.

Alex

