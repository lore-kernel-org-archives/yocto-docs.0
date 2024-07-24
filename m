Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C246CC3DA61
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 12:08:59 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.8991.1721822937771621155
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Jul 2024 05:08:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HUKJ7nWk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3685b3dbcdcso3744616f8f.3
        for <docs@lists.yoctoproject.org>; Wed, 24 Jul 2024 05:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721822936; x=1722427736; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OHUai9JseZI7w+cdk8pGWVb6yz278XgMu/Dg+sm1/Y4=;
        b=HUKJ7nWkRgBAn0CsgzDV9LifnyPQj05XDnjCGhEIX5E3dPePhmmXj1+peiYmOe5s4t
         Ia0Nf2Npz+jqqBmANlrrTvvjY7QeSvTHzxZzi/Q6rfilkHE9bE4sItJhxcW7Doto4GaA
         8m5d38JBQQnFPFUCurH9AO25TR3ZEVMQFdhNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721822936; x=1722427736;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OHUai9JseZI7w+cdk8pGWVb6yz278XgMu/Dg+sm1/Y4=;
        b=KykugyXHGhq2eIMPyK20tDV9cqWEqGi0RnuCGwEoMuS6zwZvkUWTIyddNJc2LHJ3MZ
         QhwECiQNCTj8Qtht3zdDwEFCiXIps2klTf7dFcsMRn8c0VefLRuMqLFyNRXEKM3Cwp1q
         unDVmp+/4pfshsjubANpnzNXyVy9zDLDGQM/n7eT2v7bGs5Z+gTX32WXv8o8Ahu2oAFF
         ZjmBWAW22vEhRlFQlUFaeteMCROr8olZSQ99ewmxYziKjqZkcR3rSBGkwM/evFwC2+nx
         AiJtEzT+WggVlAfhTtIsPOu+5SKI90BaFmmBKhfq+SIleOWRGTj2f3//de9LX4jE86iz
         KuTA==
X-Forwarded-Encrypted: i=1; AJvYcCWrwXFy0Iab+J0RbPyhAmcraW3WLkdv2cKusOWteCDyw67Za33qylRU6TxtAnSP5AcaaHl4niP4ZCWsWifAs1k7beS8YsbTEE0sbU0=
X-Gm-Message-State: AOJu0YxpZbx89G+9keN3Rg3bwDOZuYlCiBtpx3UBycvyBs4ll1miJBki
	I46MTTPG+HyPlt+aZjb4Y9GS6k4Cx1d35C+R7+Hcrx/QBeOxTD3356jCgSDgtac=
X-Google-Smtp-Source: AGHT+IFewivclFjCqaIRlhHaWjkbhII7YYn7SLY90tf3YUfmQK8kOjsZWCd1ojsywSzchjqWW9x+fQ==
X-Received: by 2002:a5d:5983:0:b0:367:4dbb:ed51 with SMTP id ffacd0b85a97d-369f5a55dfdmr1698206f8f.0.1721822936093;
        Wed, 24 Jul 2024 05:08:56 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a74c:d12c:aa87:d7af? ([2001:8b0:aba:5f3c:a74c:d12c:aa87:d7af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-369b77b4d2bsm12137869f8f.63.2024.07.24.05.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 05:08:55 -0700 (PDT)
Message-ID: <a8b86f23a04cd9480dff334a7b235cf9534bcbbb.camel@linuxfoundation.org>
Subject: Re: [docs] which doc would explain how to generate .debug dir with
 symbol info?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
Date: Wed, 24 Jul 2024 13:08:54 +0100
In-Reply-To: <a9269ac0-aa3d-e961-a76e-dcfe65d2444c@crashcourse.ca>
References: <a9269ac0-aa3d-e961-a76e-dcfe65d2444c@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Jul 2024 12:08:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5326

On Wed, 2024-07-24 at 07:49 -0400, Robert P. J. Day via
lists.yoctoproject.org wrote:
>=20
> =C2=A0 sort of a docs question, but a colleague asked me how to configure
> a
> debug build so that the binary files and associated gdb symbol files
> ended up with the following corresponding pairs of content:
>=20
> =C2=A0 symbols/dir/stripped_binary_file
> =C2=A0 symbols/dir/.debug/same_filename_but_containing_only_symbols
>=20
> i jumped over to the debugging manual but it's not clear from what is
> there how i would do this. is there a convenient table somewhere that
> maps:
>=20
> =C2=A0 various debugging output structures -> options/settings to use?

I thought the builds did that by default, with the debug symbols in the
-dbg package?

Cheers,

Richard

