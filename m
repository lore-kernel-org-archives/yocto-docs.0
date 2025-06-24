Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA63AC77B7F
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 10:10:47 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.4915.1750759837696054268
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 03:10:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a3x1uIl3;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6fabb948e5aso64867516d6.1
        for <docs@lists.yoctoproject.org>; Tue, 24 Jun 2025 03:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750759837; x=1751364637; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kXtWA1WiXLcM71eobHjJ3Ql4dLOjIH59zOg0tpIaTD0=;
        b=a3x1uIl3ZU2nZxORsVSNq+5y9afePQvoxY2MvQYqP/K1nEIdxeWAxM1HRjd/59DKC6
         /UgDBgZqTK7gwHtoSuWL5qSUMXrlaHJng8aUi/AnEwU0qN/X+pQR08JADwA+cLZzCSxc
         120dYIPSuoArecQwYsy9GACZI3IZt8ulVFDEgLH3pxvvq58juWzNeJ+uq2beE3hbaHuL
         3EtlLt5Sp10p6t+9socnoA87vlaP4i+ku5pivuWsdvTp0bNjhlIDQDfgxwu9tKDTBQYK
         k36ncOElRXW/0bFQq7vXeGkoqHLVm2u9Tu1/6I298ocjLAXtysMIt9nBcl+CKGuPzFgK
         RmJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750759837; x=1751364637;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kXtWA1WiXLcM71eobHjJ3Ql4dLOjIH59zOg0tpIaTD0=;
        b=HKRrVPuBZ1r40DhQJPosgPLiMVeHx37m/JkAnVO2kMuMPLN/dXgIoF5N6Js0bD/VvV
         nyRu4Qk0Z29KFLzAngsyamRuX5l+8tCBQCSJfqeS63SR5eNurF+voo8ifXU8hD8zxWqp
         7CUpHR415EINqs+jsTv0Hj++c+XXW108Y91MMmmhYmQeujF7d6Mlna9XZKDC938GXvcn
         6anEKT9KzqMLsFghQOb+ifciLimijdkuwI0PGReI/uKzlfzmXcSAUrg9w/EPXvhVKxlZ
         Z1OrlhiYiaOmF38ou/qDFJyW258qlEwnsQV1NAy51651fFkHRRzHjQkjVk1VxtiCzrqN
         L9aw==
X-Gm-Message-State: AOJu0YyPja3RAfQM7Re9frfbt1kuVj13w/0yID1fRb6yfjyCNuB9idHt
	EzhjTngGg+6r1y427UJd40AN2vFamIVdiREhSIEOX4BEhpCOsi6iHj+NPXzSZZVPdHAOIHgpMJI
	OaVIbmWGGNBLSVCkax2ZxH1GDtHqFVjA=
X-Gm-Gg: ASbGncvCbSIBxE571bSBxFk/WzegYvlgCQbtLEQ66dFXoj8xiL6NJ68d4Ue97ABqiIT
	n1bkleEN+ZbofVM0mELwTmLkXteU/GjbKaPYqJDh71ZoqhIIacSciBDmj6m6dNjzrfZCLmybJJV
	lnD0cwnoVyTE0l4n3mS0fNJCjgDwo8LwziVDsbnLkyMxz0mLDA/Klf3+45EHufgL0oj4g98LhwW
	iWERQ==
X-Google-Smtp-Source: AGHT+IGPHgGyECp6Vx1MWJq8G1kk/hmvy/JkcVQQlr2Bm/cqbRWMzyJh3Z8O7KNI2rMp4LHe1xrqHSU8JWqqWsbnHFQ=
X-Received: by 2002:a0c:f084:0:20b0:6fd:1687:2e0d with SMTP id
 6a1803df08f44-6fd16872e72mr143721406d6.13.1750759836695; Tue, 24 Jun 2025
 03:10:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250624-migration-5-3-unpackdir-v1-0-ef6ef00d5cbc@bootlin.com> <20250624-migration-5-3-unpackdir-v1-1-ef6ef00d5cbc@bootlin.com>
In-Reply-To: <20250624-migration-5-3-unpackdir-v1-1-ef6ef00d5cbc@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 24 Jun 2025 12:10:25 +0200
X-Gm-Features: Ac12FXzA-O3GxmhRx6N6J9BZr_V4DjQOHOuS7jp6oAMr-HJsp6SdrUzJU5CPJ9E
Message-ID: <CANNYZj_qqSfRq=CSMCY+rgKxA8vRA_M=sN-YzHzm3CHS_K_Bfw@mail.gmail.com>
Subject: Re: [docs] [PATCH 1/2] ref-manual/variables.rst: document BB_GIT_DEFAULT_DESTSUFFIX
To: antonin.godard@bootlin.com
Cc: docs@lists.yoctoproject.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Jun 2025 10:10:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7209

On Tue, 24 Jun 2025 at 11:55, Antonin Godard via
lists.yoctoproject.org
<antonin.godard=bootlin.com@lists.yoctoproject.org> wrote:
> +   :term:`BB_GIT_DEFAULT_DESTSUFFIX`
> +      See :term:`bitbake:BB_GENERATE_SHALLOW_TARBALLS` in the BitBake manual.

Incorrect copy-paste.

Alex

