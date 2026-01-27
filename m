Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E969FD2FECD
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 17:47:11 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17765.1769536026705132694
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 09:47:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D9CXcXhT;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-502acd495feso68704861cf.2
        for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 09:47:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769536026; cv=none;
        d=google.com; s=arc-20240605;
        b=IL8JhSIy5Zz5MSHcSztSJJZPvnlNxRbljszug9Y+D8mmp1zVDbEHai7uYItxONqjB6
         w8hvJkdULW+w+/qf6qsjuLFlf/9hwsN4WWZbJe5axoCFxovKrSPF/oAy7PlZtG+rxAHx
         5Gp/xLRUnSLvnhIE20bqebQuOE3xQcVkz5VBHg9yWGtXJuLKAV82iNnFQVWzWlUrwAap
         Ba+RusMw401+CtBhqi5rGqrM5O7EEfl+YaSnS7y41iVaBNeuKM6dnvpocqPg6CYKukzx
         swpGyxRfUnCEqlxY9JR/f9drYVevguqPHAZWvEV952SRRca8uxdjYpjdbavwGraiEAYa
         20HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eQvQk0yeTFxLKE1B3hpGwIjNTZpr+MmBS/ubdrvqD9Q=;
        fh=7+/eAL2Bno14LDqmUiuISMzgTfM1F2T58+fg+YB9pIw=;
        b=fNS1x95tJtZ3YojP845lHLd/3nOuAwPojG1Znfs4JhLhaOR2TMXLjjLi2I8rukD7mO
         0sRdXdkaWovweUa16Cz2e++1WQXONu3lk9QqpBJw/WHwhYSObDBRpiIuYYQC7U7TMPuL
         KQxT67reitUX3xvSbjO9h2DxVJSiG7gKOnzCv8p3KOe7D86yM2QsWYVfWBRE35HmGay5
         1puTq7QttWiP6yNj86mefWnciVHzDK70kjAWic3t0GOEOWlAyXXLDYohxPLLhbktPILN
         MUi/6AK0mnqlB9VbVux/L2l6Q1CdDKrIH/PcI3KvYRU1W0ktRAPOi8XDosSIVhHLnoRr
         Prmg==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769536026; x=1770140826; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eQvQk0yeTFxLKE1B3hpGwIjNTZpr+MmBS/ubdrvqD9Q=;
        b=D9CXcXhTjpnS6R3efOWNFO5tLJL3rGkcvEs6zryovc9zV++FYNS2xC26UTOV5ewsVS
         W8j6nD/4jVG+R2w9ND62UF1vTIViZaWajKTzZuehZpVt1xrO1Ui/SimuoeO1JeBBh3Bu
         DPFmLUW7/iAqXQ0wcupHjXTvy92bJqP69w33p2RIR4JRuzJq0779Ixf9cFanqG33irYg
         Gy7FbzqbYlC0PKIM4AixbRwjB6p+XDf9Dnnt6ElR8nLFngaxCSqpYEuTlo4rxWskR8fr
         FZHVOmD9ppfHjcdJQMBbKJZf74D9oXzGLbxyoCxe4es7dTzF6adQfdEuZb8wwaSowiHn
         qt4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769536026; x=1770140826;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQvQk0yeTFxLKE1B3hpGwIjNTZpr+MmBS/ubdrvqD9Q=;
        b=YavVF35Dfp1RfSwMq5fb0p/msjnh1KTqRA/+ty01TelsG3OdR5jJ1srNYaDBW/Gbtf
         ZVqpNgW4gQxeWS7DcebhNYaxphAHY2IbCvKCsdavPlIXASvWnkZJM+nAvz1G5thrNxMI
         UYT+mD+nK+UUF0+Fy5bWArn8PSp80alslmnx5dcG8/KH9RmF95eAP9UYTXZ5MDgLFxh9
         O0hU+wlf4q9+aFy5gqnMYfeiFXfoSf33NuAO4J4d0rMDpiS46zWq3ZQ9HFYaRao20OOA
         lsgGEwfi+Lp4KvekinrpMUandh1SmTDVGJGBvFlrqZTnMzhj94d+Z7J1Qu76xyUi1ZDI
         jN+w==
X-Forwarded-Encrypted: i=1; AJvYcCXblFAY4iTsMMXBZ+m7sBLUwrry34AQ6GvzgwkKa0LEJUXi2kCpMDDMKz/tF2RYwP+rQgwy@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxMWZVmvvs1DyxSlinqJvBKv7nfCzJuPRY7HFRlXysvAB2XOvmv
	/rX8qdva1JbUb/eb49aocBKXC12BXtMXprxTn5des3lpGgFpqgu0gjOuP1Mbf+Tk2qG5q+Pyukw
	N58kXYvS4hP4g3T9+z9QP6gOAtP4bM2c=
X-Gm-Gg: AZuq6aLd+D0PD1YX8RoTM1dhRs6QEZrAFgra1oXwCBUgAI2z8MRBvKbktFdoJ6PyKtW
	54a0fmctIch7gS5a444TtSpqrk/HE5+Idw5y2G4RJ5Z5m0mP7+nQzwiBY8gjBv4+eDt+ZLj/6pe
	2wmfPieXJE/rLxBe2eLf3vKy5SRre5Ae+IWZkcooNTvusQQ6j4v3slLasQMBEcT2S7F3JoZkmz2
	yo36e6kPgwDih2jSm6pw8Fr2OjafvBX3I6uem0MIrpXTQnJB70eqnsri01lmmUwfjlSRTC4f3ZE
	5ex4ttSgJ+6JTBffn2swaJVXMi+kYA==
X-Received: by 2002:a05:622a:11c2:b0:4ee:26bd:13f3 with SMTP id
 d75a77b69052e-5032f74ac2fmr31556061cf.8.1769536025671; Tue, 27 Jan 2026
 09:47:05 -0800 (PST)
MIME-Version: 1.0
References: <20260126222743.411405-1-daiane.angolini@foundries.io>
 <20260126222743.411405-5-daiane.angolini@foundries.io> <DFZAULAJWR0S.1RQ0LXOE4BSUR@bootlin.com>
 <CANNYZj_Y1JiRoXK3iW2mwe1Cvga95icXtx3FzByfBzRs4upMuQ@mail.gmail.com> <CA+HEL791UhQ28wsGx4zofiadgbgx4kfYDG+fQR6P1PrTvKQeeQ@mail.gmail.com>
In-Reply-To: <CA+HEL791UhQ28wsGx4zofiadgbgx4kfYDG+fQR6P1PrTvKQeeQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 Jan 2026 18:46:53 +0100
X-Gm-Features: AZwV_QiMI_oqoAiPR9lA15_jEFvZ0y44diVV5Adu1DkT0uLLlORZBEZ-wieBXO0
Message-ID: <CANNYZj9+x9hxi2XFOM5G5FUCTT+tkrwmtoY89JrOSQMPpx2gJQ@mail.gmail.com>
Subject: Re: [bitbake-devel] [docs][PATCH 5/5] docs: Fix sources as required
To: Daiane Angolini <daiane.angolini@foundries.io>
Cc: antonin.godard@bootlin.com, bitbake-devel@lists.openembedded.org, 
	docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 17:47:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8746

On Tue, 27 Jan 2026 at 14:27, Daiane Angolini
<daiane.angolini@foundries.io> wrote:
> For this one, I'm really guessing. Because, when I made a "wrong" json
> file, I got an error that bitbake source is needed (so I added
> bitbake).
>
> But when I drop "sources" completely, nothing is created (and I was
> expecting at least the top directory and the .conf files)
>
> So, saying it's "optional" is not accurate, but saying it's "required"
> is not accurate either.  But I don't quite understand the constraints
> here.

It's just that these are all not very common corner cases, and they
aren't tested. We test the common case, but if behaviour in such
special situations doesn't make sense, that can be fixed in the tool
itself if there's a need for it.

'configurations' without 'sources' doesn't make sense though, as
configurations contain lists of layers and fragments, which are both
references into sources .

Alex

