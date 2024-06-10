Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80022C27C55
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 09:41:10 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.15579.1718012466852914756
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Jun 2024 02:41:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bcnCWDpf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-35f0aeff7a8so1972221f8f.2
        for <docs@lists.yoctoproject.org>; Mon, 10 Jun 2024 02:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1718012465; x=1718617265; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8GeubgvKhv5JGz/VHD9oJvpe2Wu1eXGUkfucOtbtYZk=;
        b=bcnCWDpf807Yv+np+QBTsCKjgj5YHtkbuNUzcF3ziQURJy5onBNiULf2NLxtU2PNJN
         dG20liKA03IbpdrcB6FazDNPYno/qFz3mtD3MpAQhHb67NH2V5DCScO0uP9Mc07DdjE7
         0DbXfv4NIpoqUqanTdKqiQaRsDhPrIXrqP73A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718012465; x=1718617265;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8GeubgvKhv5JGz/VHD9oJvpe2Wu1eXGUkfucOtbtYZk=;
        b=dF9BtGfEHIz88wh09VSN+fnkOkbYL8B2HeFO/3kSoNlU1x2ouU61v+H9FkyY91oM5w
         cBhgkpK2kxh+GFY4+qBpiOBSOvRCmMjoHfx4hsHZerZNbvv+kSif1oiOFjM3YowjvqMS
         AqzbAtjBhA/8fogCTvscqc69ntTCIgYGgSTk3E4KvVnp8fMGzp51vSyZcjgev+FN+cx2
         1F4Wiv8kuv2IeaUlTIHAhpCHyUIlhxbVZFftTJpNJNLMFwguk0bk1lSXqYDEKa0IrxYw
         x6wXJvQrKTp2M8bwW3EEAItagUHcMbzIaWrTBno21mn6DKEQLRnO+ZZu92NbkAf0fAYp
         svUw==
X-Forwarded-Encrypted: i=1; AJvYcCUshWu/1VE98Le6eRq+7uVpeyaHuSGLPyU5kTEtakUtiT7qnXrZJLEmG5x2eLH5IHu5i152d2OPLkQCCYVb62s6uwfhCzBgAl5glGM=
X-Gm-Message-State: AOJu0Yzy3buhgcg8pD+5DdyP1O/8WEEfTIA13gOTQKr9w3HGnrwQWe9c
	U6gdvovLqdM7ceKYoBT14UWcZ5mdLzjgmLbu5GczqFVf3hO/j/dU+k82UI6NRxg=
X-Google-Smtp-Source: AGHT+IHQa2cW8SJEmZ0Yf51oe3VKsJ400L4RNievhKS25qtciVbmii5/wfamWdpYITWKgFc0ncxL4Q==
X-Received: by 2002:adf:eac1:0:b0:35f:1f8a:e69a with SMTP id ffacd0b85a97d-35f1f8ae6f8mr3803654f8f.49.1718012465234;
        Mon, 10 Jun 2024 02:41:05 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fc3b:77d4:176b:a54? ([2001:8b0:aba:5f3c:fc3b:77d4:176b:a54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f25599edcsm1846919f8f.90.2024.06.10.02.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 02:41:04 -0700 (PDT)
Message-ID: <83ab3186c0cef914974e272a3b86a2acbec69ac3.camel@linuxfoundation.org>
Subject: Re: [docs] [bitbake-devel] [PATCH v2] fetch2/wget: Add user_agent
 parameter so it can be used optionally
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com, egyszeregy@freemail.hu
Cc: bitbake-devel@lists.openembedded.org, docs@lists.yoctoproject.org
Date: Mon, 10 Jun 2024 10:41:04 +0100
In-Reply-To: <CANNYZj9Tr6d9khKBq_qunZ-54DXDj1es=to8aSk9kkecbZqJSw@mail.gmail.com>
References: <20240609220226.977-1-egyszeregy@freemail.hu>
	 <CANNYZj9Tr6d9khKBq_qunZ-54DXDj1es=to8aSk9kkecbZqJSw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Jun 2024 09:41:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5291

On Mon, 2024-06-10 at 06:23 +0200, Alexander Kanavin via
lists.yoctoproject.org wrote:
> No. I really do not like the idea that we should pretend to be
> Firefox. And you didn=E2=80=99t answer Ross questions properly.

We already do that unfortunately.

I think the biggest concern I have about the patch is the variable
name, it should be namespaced into the fetcher (BB_FETCH_USER_AGENT?).

I would like to see some answers to Ross' questions as well though. It
would be good to understand what kinds of problems people are facing
that need this.

The trouble is that every time we add more configuration to bitbake, it
complicated testing and if we can see one way of working for the
majority, it does help reduce complexity. This means adding new
configuration and code paths does need careful thought.

Cheers,

Richard

