Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3296C87FCE
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:56:02 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.12502.1752594959123849664
 for <docs@lists.yoctoproject.org>;
 Tue, 15 Jul 2025 08:55:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IUonCq3r;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6fac7147cb8so81878426d6.1
        for <docs@lists.yoctoproject.org>; Tue, 15 Jul 2025 08:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752594958; x=1753199758; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h5L/Ki5nH7sJDq2bXfjEd2r+DeBph7LkFfW4RAgqgI4=;
        b=IUonCq3rzzEt/L9EGg/LwKP421AVavAeqIn0WDk5LHfxgHa5rLkn8AS2VK1INmQS9H
         /KMctJmd85HbmbdKjP4OCOes5V2U6M4qYG1vukDqdO/zEZRTsXLW74oMdBp50AGNwuJo
         ZXB84/F47ke6mXinsiKLtnfLhwg/ctV6zD4u/Z8VZuhEeCb9RciWn18AGTW6xLmaV4O3
         SXu+Dttd3Ni1qypuWS9Q39Ul/HsEzZuByXCovUWhPITX+Xq3gZg9Gr/wAawyKLwnW0Vy
         53pVmR/Ufls88Bm+gXnueShP2F3KNqvoq2eoWu2NAM61bOhXrc61uB2TTEZc8dMn+BWj
         3aCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752594958; x=1753199758;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h5L/Ki5nH7sJDq2bXfjEd2r+DeBph7LkFfW4RAgqgI4=;
        b=pAJ4iNkdO/gRRQb1ral0xaMPRH63KywEETwiMxqdsSJwKdS1+Wkp3in48m3swZLvfs
         aePQ0QLvZp9F6o00h4M061kK5dFGkFQEj+GVEDGqhJnnRJ8e7qDttBuzWjrQIpOGKxdW
         fOQn47iSSKMCZncK+UB0wRyDS703kc0IYMvc0fpSkJkYs53jz61DRWXQ0HB4gd1BF6uq
         714bgOPWorgV2paHgMtTJG7NjGj0c4MV9rhZcECZ9YUy8liI2o9spFG78Z6r5jLvAJyv
         Mzm/gdkP0e1PG1KoNq8ezuYC+Dy53w/Gkay/aKqP9CZbTgYtBKLa5VLsIONM9KUH00xi
         K2Pg==
X-Gm-Message-State: AOJu0Yzp3AHAra0EBMt55vy6P2vWLHSGY+UmHFjYmTTe6yZ0OjGR0y7+
	WFw87eF+tFBaEGuV4oBcZwQvXZivjm8c0AvY8MwWYXOpmPHUnv5TveBkSI1y20No1UjJACNDgND
	i6EicNFtvZRsgIPx5vs36BTANMzSH7T9nv/y4
X-Gm-Gg: ASbGncvCBu0A85O4pqr6fgsqtML7G+ei1cwZaRGK4lk2uBBeHE0XILmSnCIReqxP1P0
	eDJBpCeLFm1dkOGccu/bdrEC9JaA1Fb26ZE20Qz8+1mOYg7Km+vkkLDwIMENn4gCoJovu4fqdOA
	B8ldJBM5UUW18tjBOQATVkxtSafgwDDTSgXht/KXNzfTCB3NNSDM5xHIIDNP3fe5FJ09JC6oU++
	5Vk
X-Google-Smtp-Source: AGHT+IHiaf+oqUXeEMorFAJYtgdApAKHPiagYYGCErpGiqunrcyC2YRQwcTahNXpRLgAu0POqaHGWN2pER6odGUxXIY=
X-Received: by 2002:ad4:5768:0:b0:704:7fd7:c06b with SMTP id
 6a1803df08f44-704f46ed6d9mr470246d6.0.1752594957815; Tue, 15 Jul 2025
 08:55:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250715-fix-persistent-dir-v1-0-e3f31214b677@bootlin.com> <20250715-fix-persistent-dir-v1-2-e3f31214b677@bootlin.com>
In-Reply-To: <20250715-fix-persistent-dir-v1-2-e3f31214b677@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 15 Jul 2025 17:55:45 +0200
X-Gm-Features: Ac12FXy0R94nbKM21CNfTNSZ7UC-NX3dj5-uNXnOrABZwwB5csCe91fQk5eXnr0
Message-ID: <CANNYZj_kvLsZG3sgH+nPu9B=pqWBU785w0SGHGdQqB4UW-DtmA@mail.gmail.com>
Subject: Re: [docs] [PATCH 2/2] dev-manual/start.rst: remove shared
 PERSISTENT_DIR mentions
To: antonin.godard@bootlin.com
Cc: docs@lists.yoctoproject.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 15 Jul 2025 15:56:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7338

On Tue, 15 Jul 2025 at 11:56, Antonin Godard via
lists.yoctoproject.org
<antonin.godard=bootlin.com@lists.yoctoproject.org> wrote:

> +    -  Set up a local :ref:`overview-manual/concepts:Hash Equivalence` server
> +       with :term:`BB_HASHSERVE` and :term:`BB_SIGNATURE_HANDLER`. A basic setup
> +       would be::
> +
> +          BB_HASHSERVE = "auto"
> +          BB_SIGNATURE_HANDLER = "OEEquivHash"

This is still problematic and should be clarified further:

1. BB_HASHSERVE and BB_SIGNATURE_HANDLER do not set up or start a
server, they set up the hash equivalence client built into bitbake.

2. The above client configuration (used by poky) also starts a private
server that is specific to a particular build directory. So hash equiv
information would not be shared between multiple build directories,
and this will cause sstate mismatches (as reported in the bug), if
sstate is shared.

Maybe it's easier to just remove the above, and only refer to the hash
equiv section in the other manual:

+    -  Set up a local :ref:`overview-manual/concepts :Hash Equivalence` server
+
+       See the :ref:`overview-manual/concepts:Hash Equivalence` section of the
+       Yocto Project Overview and Concepts Manual for more details on the hash
+       equivalence feature.

Then we can do a correct, comprehensive description there.

Alex

