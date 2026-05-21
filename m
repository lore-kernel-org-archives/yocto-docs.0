Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C17BBCD5BAC
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 15:39:17 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39746.1779377948852810942
 for <docs@lists.yoctoproject.org>;
 Thu, 21 May 2026 08:39:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dUsamBrX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48e82c23840so51219545e9.3
        for <docs@lists.yoctoproject.org>; Thu, 21 May 2026 08:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1779377947; x=1779982747; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9723FH0NT3mruNqcWHQR9+mE0FKztU3jGwB41QobNwQ=;
        b=dUsamBrXcdirNGHg6xlg3yWUSEXV1dGU1PD9p8lyJ/enobiYHAx0iEpmTgVtntsIrW
         ETsaGAyZGlslKMRziqt6gHzyFny01aDg1Y6SEKOiVh/xargDByn5My5pttzdl+x9PSC6
         a5sVourwUPEE5QRLIeaZkiHHlc9TbU5lJRU2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779377947; x=1779982747;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9723FH0NT3mruNqcWHQR9+mE0FKztU3jGwB41QobNwQ=;
        b=LSvtKwO0i/E2i/RtfpJ3OEmHCUcFcniYscr62RRsCglrZFUystR/DmvYnldQd2N6sF
         cjWKcwNVsPAV97xYQ5/pSgMHTstCJTDv/0Dbe7ZLyD3vpXtDV7BPLCNqb4aTLiDCzx2K
         cUwqWmEo1/pc1v3OOmuNx6LrxzrmKw34Vc5GvVIskpC9p/ZbRCa9/ic6EsbYxKE56OQ0
         BCCW7ZLf8DXAbFJfqRgVZATCehAp5lemQr2uo/pYs3XjG8M3Ttn1VRcVJJ/s7tbac5Tl
         GE0Uujm8+3VjsERcA7bqbX4QsD9RzmSpQp8VXfYexWODWoQ5VmjEv9cqqkNe3w1uIGUP
         TxIg==
X-Forwarded-Encrypted: i=1; AFNElJ8YjmQnX76yZVmA7REUzM/c1Xhc+zzz20iKfntTW7wDPiHwfsbHafvLQooUwSPv5EdTPLvc@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yw7J82saGdS5msiIpzueVszCIii6snJ1MEd+1Q4bJYYq/jG7fsE
	+2IVGvAbBp5OImpoD/UdatFZ/Yk0e7DbZOXwKdTRsbVbXfJ5KYoD12T5C1Avhi3fm+eMa2Bv5Px
	SVcfP
X-Gm-Gg: Acq92OFEbDjmMBj35NqYkhT4TsjeRcGWGkqEe8T2BrjJG7YzJyApIQM39moRN0J6pv/
	oYqPvOtAEACGdArLHILLyp0v7MwvMOGdn3167+H9sYA2MK/rwvFF0CPtnyz9RRNl6TSCjK94Tk/
	ftbMCPaxmBOoVQ0yghXYHTUIIk5XkxXXizXDqfQPVIeUMRNzPQlAdzucmpYUvGb/zT1/zFkuA6Y
	bu5Fgk9SaELyXyaiLttNn7ketDZ8vtNGdOU7i/hmfzQcHUNQBekwEgVS2/gnNLrwDx7rnPBzk3t
	88NPwRZj8C5ymumBLT/H5iSzEgMV40ywsjTUNzxAUoEVqQseXrVxu/wJijX7HXG4nq6IKg7fNBB
	oMhcI0AA5cJ8rdONg4ltdPdRG/344mrBdNMRc3CgTb9KREy5i+haIT2/2ovDbLCzmfH9zex7x89
	o3lCxnZW7t4Ti3/cBme50ENpfSdrUEcI4fgPdPU6cJQ3VWO76ssczEWpXidAWJQOFoH3raVLc37
	f2WrmVbCB/PdCy6
X-Received: by 2002:a05:600c:c0c3:20b0:490:4033:d3df with SMTP id 5b1f17b1804b1-4904033d4bamr3356725e9.23.1779377946987;
        Thu, 21 May 2026 08:39:06 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8b8a:4d15:b8f5:8634? ([2001:8b0:aba:5f3c:8b8a:4d15:b8f5:8634])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa7d0bf6sm3894265f8f.7.2026.05.21.08.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:39:06 -0700 (PDT)
Message-ID: <b0f542761529b2fe6780058812cfaf23395def6c.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] bsp-guide: update "README" to "README.md"
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
Date: Thu, 21 May 2026 16:39:05 +0100
In-Reply-To: <e7a80285-e53e-d4bd-15dc-a19e5d8fd091@crashcourse.ca>
References: <e7a80285-e53e-d4bd-15dc-a19e5d8fd091@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 May 2026 15:39:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9521

On Thu, 2026-05-21 at 08:35 -0700, Robert P. J. Day via lists.yoctoproject.=
org wrote:
>=20
> Since the standard for BSP layers appears to be top-level "README.md"
> files rather than just "README" (and since some of the links are
> actually misnamed because of this), do a global replacement throughout
> the guide.
>=20
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

I'm not convinced about this. We recommend there is a README, we don't
prescribe a format for it...

Cheers,

Richard

