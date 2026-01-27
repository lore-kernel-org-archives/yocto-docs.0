Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D00A6D2D8F1
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 10:35:18 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7824.1769510112758645758
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 02:35:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iduJ00Iu;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8c52c1d2a7bso722670185a.0
        for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 02:35:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769510112; cv=none;
        d=google.com; s=arc-20240605;
        b=bOsnZZgJdqc6PW5jkDiqjo9u18ZmZeDhdkxelpODqW5rIJXzbZ/2GqrnCJM5dkIQLs
         uMii8PDsdn6ahvtDkf+rG9RzcB+1++myFDGlO5vvNa3M/7Ueac2vVHL0lroMsohHrBWn
         zLCYJ5RF7q9FAV2rBfXaAhIhRlhJ9HJGclqNxm3MxIQ20ktlVIW45taf5ihReZtXpVlH
         K3KduNBe6PcWj//LEI+wt36xe12rC0WCqLdk0Q6yfYMApekftLmP6MZQjdIdlOn2qHed
         ho/0M+SzIxzyJtDsiLblA4dFpk2PkYYbYoD4c5+EGypZFNb4ptDHTE5oYmlsFGfMEB1d
         NyPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3gzFffLDvIdr0NjekHc53yJhmvgBqh197is7zUtJo9s=;
        fh=iIZrLqRBvDSTKees0p4SXBrzGUm49sMzxSS4U5wGy5E=;
        b=UjRjWM/wa9qJHWOWjy0/HZR0huI1+TaFXfqzmUmka140JM84s1P94TtDBNhIAqhdDp
         YI3U9Na02YJFlOo9FhacbgfiM/pQwunrTdnQLj8Aqy1h8Mu1g3+kdgS4AVayw4fQsKwO
         dNPr8CKFteBEHE1nc3Z/1D2r6FRSFmPR9ozGDpDFj+d2aJROh4611qcLy3mZ6/9GA0BM
         F/uXdx/PHOgdEYUOjHIcbBdyYFGpWKHY4g4nHahFRLIA0kKGWDheoVgBvRKZlOuHyA4w
         8T7zsRJ6SMdvFEZFrs24czJN3ZnS+fBHScKORcrWHW9YSDSQYetrZfhsbn3pxPR82YPB
         UxdQ==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769510112; x=1770114912; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3gzFffLDvIdr0NjekHc53yJhmvgBqh197is7zUtJo9s=;
        b=iduJ00IuHd5Y1F2XRl6hC0AYDw20hJ3ZmyfLx8GKWCcy3JuRvew2pnw1c55gLr1/ZP
         UCuaODCGKr7/ov9y/8PwnP8eL4CmlPInHWmFn3wzq9YaDNFewdi1CevAxHkKkE8Xhhij
         YPmW+AWuyQ1YEYaUvamQ7k+Qx8zY1HJpilcZIm8yHcmrJjm/zOk4oP/WR4Ulqv61KYiE
         QxQEy+1cI08wGJVsIIoONJslj0+4QbMr/0fWR6Q3Vj/Fs4OFM9XE3XATxWgX7Kl60MLm
         ZWEVSgW543g8zPuDBVrDUcGJqyv2R5gHDGcrvwOJNkAuHFDMy0iorp/qSljBRaIxLVqd
         jIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769510112; x=1770114912;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gzFffLDvIdr0NjekHc53yJhmvgBqh197is7zUtJo9s=;
        b=opKyfylXodrvCYHIhyf4DaHOt/NVYYf2JlanD2P5nAHyYEE6Vtid330YzwDMLlKE4Q
         5rzDOPmkeIjD4hMyAmTbOmyA3yPr4DMULldyAWLssBr8rJDt8Tj7n5+E8WJDixJG4W74
         JyMOUNWc3V5jf69r7doV0MxqNwlQKTWth5dEDX1hfew+HoX7rNVf0qJU/BO6IqgtzzIX
         fhfDHuQ0lf8eRP2y7VrDPnNWc37h1NT8VFON/dJo3i/Mo+deSq0Ia10e6OZ/22Oi8bVZ
         dfhB9nqF+Zz7ySiRnNVqYOFfu50z85H92kIuEKMvCnGjLBMIdeqXHUqEEJfrb2lXDK23
         YR0g==
X-Forwarded-Encrypted: i=1; AJvYcCUCCT7KrwwjBqFOeX//bvb/q0LrsSWi+1C4BriNKTKyigbekH4fhV9L2vqwDNEx86MJ7eN9@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzDVOJ56zKJGtW0MylAe9xR4roL1ZRhXgGZMrkx0raCm6ACUCyb
	Tizj/n5sq94kWMzdIKUmWBuaMNikg8Is4V8jQ31Q7SfZvo9HVfT5Z3tclJ22zRiR//oWzIZEMGM
	FT8CdCOivTvRPzh6vL6qcgDeAip4e5nw=
X-Gm-Gg: AZuq6aLJ1Bn/iZq4+w8wjq1rF5NYGMVa3shx4BT+Jf1VT1HWJ03XE1lRzvTCKPTDygQ
	RxkL6wI4P8TG8EyNccRvf29soyZrjFavUv6WKC/XPDvam8BwSJotIeTOs2IZMn2DOCza/NQvyFU
	8+9PsYRiPLNesBtzAKVF85kHtXGXD4VJTDgMZYVNMF+ofNlnjqFgGvXLRFYfyL3RBtastCv/LTi
	VqwTFg834LlPRFVeAV+AWJR5xGQROEqx9Z4syx+iDqqAKqcQ5ZGl838zyQv2dWg8xDwiM5XHPev
	tMxaCwtHFZfii+JoI0fJQqNmcmphWw==
X-Received: by 2002:a05:620a:4593:b0:891:7008:f2e0 with SMTP id
 af79cd13be357-8c70c17d025mr105188685a.8.1769510111650; Tue, 27 Jan 2026
 02:35:11 -0800 (PST)
MIME-Version: 1.0
References: <20260126222743.411405-1-daiane.angolini@foundries.io>
In-Reply-To: <20260126222743.411405-1-daiane.angolini@foundries.io>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 Jan 2026 11:35:00 +0100
X-Gm-Features: AZwV_Qjen7b5Z803R9gbwpnPTe01Fmuf2b2n8KG5yo6sDNspzyXJYMmy2gTkZc8
Message-ID: <CANNYZj9_AWqqHRWWiXg8R9y9Ash9pev2xKqUPAxzuy_1YdYoPg@mail.gmail.com>
Subject: Re: [docs][PATCH 1/5] doc: change some terminology around bitbake-setup
To: daiane.angolini@foundries.io
Cc: bitbake-devel@lists.openembedded.org, docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 10:35:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8724

On Mon, 26 Jan 2026 at 23:28, Daiane Angolini via
lists.yoctoproject.org
<daiane.angolini=foundries.io@lists.yoctoproject.org> wrote:

> -   -  ``configurations``: Configurations can recursively contain as many nested
> -      configurations as needed. This will create more choices when running the
> +   -  ``configurations``: Configurations can recursively contain as many
> +      variants as needed. This will create more choices when running the
>        :ref:`ref-bbsetup-command-init` command.

This is describing the format of the json file, and it should be
conveying that 'configurations' are recursive: they can contain nested
'configurations' in their values.

Configuration variants come into play when the tool has processed the
template, and made a flat list that can be presented to users.

Alex

