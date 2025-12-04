Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B707D2A53A
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 20:55:40 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54439.1764881734143291462
 for <docs@lists.yoctoproject.org>;
 Thu, 04 Dec 2025 12:55:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BuqebgA9;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8824888ce97so17681006d6.2
        for <docs@lists.yoctoproject.org>; Thu, 04 Dec 2025 12:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764881733; x=1765486533; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0XIJfHoF2KyBk8Ce9gHg/vKN42/VIOFr8hYE9Uiw8hA=;
        b=BuqebgA9qL03im8NSGfBpyO0bJzAUrCTUxj0SG/kfDRK3h8r0xl/KWX3FSjIShLvuz
         /p27CQ8BsK2f0Xf2F0v1U/wG8Me0Kqblt66+BIkEcWkHZcMQ4K/RhZFumEJcqzAaSqVl
         +6R9H3YDe6/p/AR7H4HtVx/BMvRU0ewOZ1LtNmXU61K6ClvUGq/RDlHQxDhi1CRLMwFP
         AAM5KxPlwteNoyazHSBWAyD3b9kJGZqvMWQNGsxcBxSxuFwOeSvctp3w2mZtNbY62rhw
         cV9nWtoucjhyY7u6Yu9//hjTAWLSX79q9z0oBi4h0IEgqCEvAN+y+JSWeoBGmaF+8WIi
         AGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764881733; x=1765486533;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0XIJfHoF2KyBk8Ce9gHg/vKN42/VIOFr8hYE9Uiw8hA=;
        b=Pivafmtjo8LzAhBrD/mZ2HNT+l4RaAlUI5HpdJ+AjQYu199Msnh31ChbQbi2qEp8CI
         7yBu08iYXMss09W0qrUn97zdn+Xer/5zNbTIXOm0RQAAocS9rhDMqcmZiHatoAt+8Y3Z
         NA1H14+VpFEEcLmSxYEGppRShRARRo0TfIQHEzUnCnJuaU5VZQvgaTkRCB7X8JNp3VFJ
         eWlT3T6t0rknRrQ+AQq+QOdNjyDTNpk42Mf0xhm/3rUlcY33sxnczzdbJ1kaZaW3YqUX
         LPB4dI8fSu03gmOY7YOPL6/cNkoUtr5fJxzBplVeAROsSfuguizeURNy5gkzhrCxCwO7
         +aew==
X-Gm-Message-State: AOJu0YwlTCkTxa3TsNkg0O3Le2OjxDkxnIiZtskx4CuESVGeydbsWXaN
	cK7GhX8SqMeyBed6ieEfI6KqIEFvktAzxAVBZZn/v9baR4eubqqYoT+IxO+waxLAQL2tWE+8WOP
	5cD0IITdXr2odWWWECwDaRy5GQhRTtA0=
X-Gm-Gg: ASbGncsnHdPgY2lBNRYIz8XSmP5qEiTboEX7lZKsUq4gw1Ibh62sgN6i2ciY+rFsOP5
	DiwCh6wQ3DNRmHrWkHznukfVj1PprE6ew7dHIRfZWmFOSZUOzby4I2D5rtMoKLDJYDXRPcY7dnq
	BPvDn9u2XBpaEkcWcCWGZk9XiEXp85RsMxtXPv6bOl6qts7LntopE1y+NFx/PFGXcQMyI8sOoSk
	ylXJNnDuDNSe8KHf0veB4LLGAPKnj9kVuM7H/sMOzpnkrUXKqsnIqT1gSz39bi/CggKfeCCrc4R
	h52Fit84RHYqsl3oS4vyEvSIYVB57A==
X-Google-Smtp-Source: AGHT+IF2ZaqJcnxhOChH21km8H4t+dbv6JVYxHp61eASgqKq3qm4QST/8Y1L4aqrdOdB1Q4uOw3+ia2SfY3K9Q9Vlxk=
X-Received: by 2002:a05:6214:4ec3:b0:888:2bd6:540e with SMTP id
 6a1803df08f44-8882bd65a4amr29262116d6.6.1764881733067; Thu, 04 Dec 2025
 12:55:33 -0800 (PST)
MIME-Version: 1.0
References: <44d6bee4-c609-3f8c-e5e6-338fce4c2719@crashcourse.ca>
In-Reply-To: <44d6bee4-c609-3f8c-e5e6-338fce4c2719@crashcourse.ca>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 4 Dec 2025 21:55:22 +0100
X-Gm-Features: AWmQ_bmIqLqdT3Zb04lW9MQLvldFG0nvPRjORQffwLNtVhiR0iLATY1RDX4v2uU
Message-ID: <CANNYZj-vDD6i0hZFxnhszKYCMFofnwU8yRQoTJcz-6ohntoL6Q@mail.gmail.com>
Subject: Re: [docs] can we standardize on the spelling of "artifacts"?
To: rpjday@crashcourse.ca
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 04 Dec 2025 20:55:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8224

On Thu, 4 Dec 2025 at 21:34, Robert P. J. Day via
lists.yoctoproject.org <rpjday=crashcourse.ca@lists.yoctoproject.org>
wrote:
>   is it "artifacts" or "artefacts"?

We can accept that either is ok? Why is there a need to standardize on
one, and then waste energy correcting people and patches? I won't be
able to remember the 'correct' option either, fwiw.

Alex

