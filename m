Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A818C5B549
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 13:08:06 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.49258.1748869676822257337
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Jun 2025 06:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eKFPvsHx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a3771c0f8cso2655496f8f.3
        for <docs@lists.yoctoproject.org>; Mon, 02 Jun 2025 06:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748869675; x=1749474475; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z0tNWb+SYzpgBImk5ETGvzClchzSAIKHyZylP79zGiw=;
        b=eKFPvsHxBMonmsRjFnjADhXs+lpIJNyX79gw7l8gcBz3jN4XijQI9+Ofgr6VyIWr0y
         cqCVn6Fg3e5N2XihYz66A6FXiLygRJjO9YA4tvAAVyVD8MMuYWUErfDXVBAhX/QZA04f
         b4QvY3MwzFeUUhvR9TLpC0/6+xqWcDlUf0BRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748869675; x=1749474475;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z0tNWb+SYzpgBImk5ETGvzClchzSAIKHyZylP79zGiw=;
        b=tls6/rFyJz/5vRZ22+jy3ZtJjCYfXj2qErT/qKscC8GyS0BrLJmTH7AbIvs2D0cWmm
         R+YpFhfV+Y+RLSOARyPhUOrkGqcQAFdou0eaevZHfLqnFzXLerc+7rbaPuQ1Vehhbz8c
         JhQhtYdgKnE5OvEqB3CPIQsDSc596KRG2jH30fGubYNtt9O1CTLJGFZULzLPXIWcfeeN
         hmZgO2xsy9cc0+ePCMGh9Sp72kMs52aYKEzJPdxU14wRxHp9QHXN6hcl/fBqC4aaaWqc
         80W/34rw+lB92JDQTTPNgTgC4DDMDfTosp8EV+qTDu7plhnizVecCQeZLc8UFkZO+V0Y
         Srpw==
X-Forwarded-Encrypted: i=1; AJvYcCVqMvYsFQD8cPzsWIVpH8WkgXApwk91zKRz+iYKWjPG4TVZNf3He6kNseIIF4D+c6KyNz//@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YyYFwBrZ/qGeGGXaNqFhxwkUQM2it4e0zxTwEZ0S1u5D4++AQBV
	RVEfsa66Ceiw+zXeQPqTnHiiX5vKyIkod0ze0T7F7sTeWxs6HCC+l7hvgUeoso0lP9s=
X-Gm-Gg: ASbGncv1lQbu8KLGgqREA7paI8tYUnHW3H+wXDhFAHT8jYbsV8/L3Y+YDkiE3OaCVLL
	UQewSU7DBRiXb3NlypiUk3Di8O40dgQsNxTbaCZ8rKUULUYKzFqNOKQ/Sb8Zw9iJW/5qCD0j+2L
	e4MdfL8Ra9mTNDAn6kX0hXtwYFTK8BUqkDjbloIB/GR49bPYx0AhDi6HwDaKLMedpAwKQzyaByy
	huljIcdnCb/ORadloU5Q4y8ebx+BqL2S+fVZlxfouvHbUdVcEnRs8jQ//jFaDmHutv3JyYhrSlZ
	3JZ2yIbAo7OirlE80EyaJfePGbQ4nl0EoffRAUfWvQs9ehIvXJo4ytxnhvFXAouFM3XFigTUSIg
	S/cwbawtKNMxzQMcDi1o9Y9d9lJOuLoOlb8OqwVXA9xXEbsUnuyc=
X-Google-Smtp-Source: AGHT+IEqZl6zZuTBPPON7FlTm2iSqqwYAjK9rG1UKeWmA3HbiQwkmBfXnkClih7XSTcuiFn7OFdkwA==
X-Received: by 2002:a05:6000:1447:b0:3a4:d6aa:1277 with SMTP id ffacd0b85a97d-3a4f89d3557mr9034870f8f.37.1748869675155;
        Mon, 02 Jun 2025 06:07:55 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:907c:f576:5b06:73b7? ([2001:8b0:aba:5f3c:907c:f576:5b06:73b7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe758besm14974699f8f.51.2025.06.02.06.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 06:07:54 -0700 (PDT)
Message-ID: <565461c8bbac11ca798213c50c0e3ab6eee575ef.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] Update Ubuntu essentials list, replace
 liblz4-tool with lz4
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
Date: Mon, 02 Jun 2025 14:07:53 +0100
In-Reply-To: <6f93430f-7953-39b6-caf7-b144f37ab657@crashcourse.ca>
References: <6f93430f-7953-39b6-caf7-b144f37ab657@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Jun 2025 13:08:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6973

On Mon, 2025-06-02 at 09:02 -0400, Robert P. J. Day via lists.yoctoproject.=
org wrote:
>=20
> Update the "Ubuntu Essentials package list" by replacing the obsolete
> liblz4-tool package name with the current lz4 package name.
>=20
> According to Quentin Schulz:
>=20
> "According to pkgs.org, 20.04 lz4 replaces/provides liblz4-tool, same
> for 22.04 and 24.04 and for some reason, liblz4-tool requires lz4
> package, so I think it should be fine to replace it yes.
>=20
> "Debian seems to have the same packaging in Bookworm and Bullseye, so
> probably fine to do the change. They only seem to be adding a
> changelog and copyright, and require lz4 package in any case."
>=20
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>=20
> ---
>=20
> diff --git a/documentation/tools/host_packages_scripts/ubuntu_essential.s=
h b/documentation/tools/host_packages_scripts/ubuntu_essential.sh
> index f3388c88c..c4231188b 100644
> --- a/documentation/tools/host_packages_scripts/ubuntu_essential.sh
> +++ b/documentation/tools/host_packages_scripts/ubuntu_essential.sh
> @@ -1 +1 @@
> -sudo apt-get install build-essential chrpath cpio debianutils diffstat f=
ile gawk gcc git iputils-ping libacl1 liblz4-tool locales python3 python3-g=
it python3-jinja2 python3-pexpect python3-pip python3-subunit socat texinfo=
 unzip wget xz-utils zstd
> +sudo apt-get install build-essential chrpath cpio debianutils diffstat f=
ile gawk gcc git iputils-ping libacl1 lz4 locales python3 python3-git pytho=
n3-jinja2 python3-pexpect python3-pip python3-subunit socat texinfo unzip w=
get xz-utils zstd
>=20

Do we actually need lz4 on the system to run a build? This seems a
little strange to me...

Cheers,

RIchard

