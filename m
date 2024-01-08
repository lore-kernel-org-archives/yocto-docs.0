Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A7BCC3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 22:24:36 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.2956.1704752667469167325
 for <docs@lists.yoctoproject.org>;
 Mon, 08 Jan 2024 14:24:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T+8bbjxY;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3368b1e056eso2195632f8f.3
        for <docs@lists.yoctoproject.org>; Mon, 08 Jan 2024 14:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704752666; x=1705357466; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=d7d5VTw1+nvcn5HtmM1uQ+P8sgjnkYJ7ap3qKNeDZBM=;
        b=T+8bbjxYpdi9koGFvWwGIfyIZ4L7S6izW/DuBD6t0QB4bBMvhNuvwh1Q7BTFnRBlHW
         gM7H4gjnV+Q6hFQUNZ7HZZxzXscHyMJPSj1wWydD0z5vTxJtSylYqEVdTUdMvb8Q6hG/
         81YK0o6gM36uYk61SSNxscIsNty7c81m1+aoOx0qBMwut4PXGewzbeHWqyA+MQ+ywiAP
         nfJVs5HBRhNq/7cd+fGCsQ2beiYN94Ogy11pYdCkjYlQec7qtiQiGC+u5H7r3a2WtK74
         waPPYu+jup01hrh51wQ0YE1J/gPra0kKY2HFbQhrRCfqmUOGY6FEduX0ABXg2j2mNVS/
         YeFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704752666; x=1705357466;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d7d5VTw1+nvcn5HtmM1uQ+P8sgjnkYJ7ap3qKNeDZBM=;
        b=G0rU84kYNNUfSS5+srbsxpH7CIRQ6sh3+tpkUqmMTM34htm07JauNhg/MiFKOh/UYK
         R2wW849akvbiYvGrB6trTZiDLM/gMIcft81iVjcA7AJRIYqcj1oNv4kPB0Geg4en50Si
         05RZNG+qNvCh5wovVwbuUTGMXmTkATrg7/+lqpl1JKDBQcGAzz4S5HvLYkE8i0one6eJ
         hb8ksPoW8EKuKDC9cOJOxPjCU+BXj81rhNO4UbFKqdbGLPNzglu9NBiwERyJlm8dBp3h
         2lopWx6/l6aId9QN/pqwLBIHI2qejnNfkI/Ttxhydb8KU3AT+ezUDaWm/6REKb8+of/K
         /tAg==
X-Gm-Message-State: AOJu0Yye+LIDiuFlWT5HVV0wiS8VRVUSmTdB2Oghh3l8tiaBTb5dtVYL
	gL62kXrTUlUbcz97BY4UK3c=
X-Google-Smtp-Source: AGHT+IHJfiRea5rxzXI8wcwExFl1u3Or0P4r6LYuKITu2A3xRp9kvtErZO+5fsaqOCtuG4jVKzBfYQ==
X-Received: by 2002:adf:e810:0:b0:336:76a5:5774 with SMTP id o16-20020adfe810000000b0033676a55774mr43108wrm.68.1704752665770;
        Mon, 08 Jan 2024 14:24:25 -0800 (PST)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id l1-20020a05600012c100b00336670abdcasm718404wrx.40.2024.01.08.14.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 14:24:25 -0800 (PST)
Message-ID: <2ac6eeef3a4c9040bddc0ab106b0814eaf852e6a.camel@gmail.com>
Subject: Re: [docs] [PATCH] ref-manual: document cmake-qemu class
From: adrian.freihofer@gmail.com
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Date: Mon, 08 Jan 2024 23:24:24 +0100
In-Reply-To: <d770bd10-d5c7-494d-89db-74e24207d426@bootlin.com>
References: <20231231154843.1418654-1-adrian.freihofer@siemens.com>
	 <d770bd10-d5c7-494d-89db-74e24207d426@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.module_f38+17164+63eeee4a) 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 08 Jan 2024 22:24:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4752


Hi Michael

> I just made a few formatting and styling updates, which you can check
> on=20
> https://git.yoctoproject.org/yocto-docs/commit/?h=3Dmaster-next&id=3Db2e3=
96bd970ea8f27ba575b49c1489e2181442b8
> Not to late to correct me if I misunderstood what you meant.
>=20
Looks good. Thank you.
Adrian

