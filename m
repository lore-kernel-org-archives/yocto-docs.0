Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 921C6CD4F54
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 16:46:50 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14950.1780073205510533796
 for <docs@lists.yoctoproject.org>;
 Fri, 29 May 2026 09:46:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pIALyMeG;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8be236ce888so136076046d6.3
        for <docs@lists.yoctoproject.org>; Fri, 29 May 2026 09:46:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780073204; cv=none;
        d=google.com; s=arc-20240605;
        b=K6VwCWBT/uf+KGn07rM7f/pz064jaZ6FBCXpqJsgTbD5ZEfXe9NfDnojS1vOJZ/Fp2
         3usd6Ucy09Kg6YFvIPr40SQ3sm6Z5QflnF0rn5MQQs5nADCds6SUR20+yJPo25REvCjT
         YSGHa/wnJ6vuDBq17l9PfAe6TykDgBwW3S+LCZRhxdgqwsSBslEKPXvAUs6vXRUE4Ff5
         kgpcmJFqOf+kjzeYFxlTjt4wbfrxFqKpZbkadEvkKzw2zSi82aHYhk1AzZ6/DjEpkiFK
         AYiBuvi3moEZoxDoT2Nwh+4uCiikJxGXZGshDFqEAl0o/FKw+T9Em85gW4eu0b5tI6Bn
         PkjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gA7KUCZetNxmlP9J9SsFeL3mWgT4oIdP+/KFvMoRkns=;
        fh=KDa2PhjbqAYHn79MbDomt8O8cjNLm3FAGHR3SUBnn9s=;
        b=eNXL4wPCI6GApBSpmMlRRm7ZkkKm71fhR7ES6+W8Sw+SXio/4txZPbmHHpRwFQyZb8
         FYrEtaIU7dj1QTyMIhAayEqZUPCVtVgIiyv44/THRAFes148cJY8k1/pUMo8k+mX/5yd
         SVitkICNTMK6XhcfMXByGCHiTTM6iKDBMfwhZ/6f8PmbscDgg5wKJflVE/pQskTBSdGb
         TDbY/GE6NSmjnFcyoxwh/mAofOeIpDTvNxPf4C77oGR9unetvVlMUfjk7jLk9pNGfPQ/
         XNapKULfAP5pIBFF6zHRiwAMm0j5I1BujqikYI92F0nBMQNQ2Y6YS89/YhGOdjuhIKC6
         jULA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780073204; x=1780678004; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gA7KUCZetNxmlP9J9SsFeL3mWgT4oIdP+/KFvMoRkns=;
        b=pIALyMeGRXyYG4wmx+2jQxqe9+HC/Fkljr5KIEmYIWqNp8Uw/KLUjR0YnFBz9GTkSW
         nlhDDqz1vLUXIX6TSTezgjDGtiss7yHhqfPZ4Bu7rW1lDPAu5pu2GynEZM1fbrW+9xWU
         Gsj/TchatzbI64yJxI564LtbEJQcWY8gMMCgS8CPk0o0yPef11H0ZjfsyHHdVBDF8wxG
         8iTroR2+NFfmDSbNSU4VFYN2YOw9g0lIsQH6E29CZQrjf5VnqSX5jNmDgSp1ZbWHpEUn
         87tr2IBy5SGB0xgiOkd+j9Rd7GcNRvHI0q7jDwn+Mc0/2ZTagi5Dzr3ney8/tbqGIzrp
         hM4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780073204; x=1780678004;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gA7KUCZetNxmlP9J9SsFeL3mWgT4oIdP+/KFvMoRkns=;
        b=svJoKQ9J8hc/tobMc0ZLrWamcgfzJ/Mq9OD1sKfHBZUNOpAiXL67rTtdU120V5rpNf
         C7g8TeRERcUUeGGPcIvbX5YveWeKRe3mgUCbL+A2anhHhUibEHeIOl82QPe7/LtVgKu8
         g+Tzv9CI2yFsKb9x5RlfdJwonMJwJpS+GKdcI9Wgqy/0B70yKCohEvWqE8jGQLdgbzFe
         0wH+559TBa2lsMDMVN0OZ2ASInWQRypFCL+8eR3JeL730ov2P0m6Yjd9VLGN66bvL5qi
         fIB6Zbg5Cjzw89xLp0b6Qaa1mLwpOTMYy/WVjUAe0AqygMgNnwAT3RZS7MafjA7wNoFV
         FZDg==
X-Forwarded-Encrypted: i=1; AFNElJ+4M1bix8V7kq785y+VuKWm1lKfwSdFOR3OtXwgrSM0djrHukaqB7It4PZ0XuD5SOy8gxnp@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzKqYLZiQn5rMieGyxhyEVl2GfNr4jwOLA40EXNQ358pdkjB4Qk
	Mm4TQRW3KFd9+ai+14X2CnNqu75SQ54Sm/n6SrAR9IoQsak9owbqMnmt2ntrJ/OYFHkyKcvS25K
	KSSOk8jdNYX4V8nh0qjrSez1f33fFIsw=
X-Gm-Gg: Acq92OH9auSuvaUJoA0SrPPNtck37NwfTlQe2U/FfYmCQj6rNSa0pXLYRPTMrLVNxTk
	RWxZrMgFDZHHrWjz3MmOL1F4iLADHIkV2UbJHiCWPcVZ6c9I4S6iJB6jBt66Fi0OaFTUWRtUH8J
	AEX0QWz9FT4uQbI3RZbNkbs5maLuW1L+vkSVbCvc9hqTtyYv+/hAQvOuaRVrHoO1GuR1GRW7MOn
	+KaQ1PoEYvOYxT4nd2w3e/GZcz2yS8TSvK/eGAELVSV3NONWZPTTpF6qLiHizkdTL5FDV/A42Su
	JZ1isAtit8XgZZoJ/EjMRoo5alE+467DCOcuaYERWkp/GKvF8ylk
X-Received: by 2002:a05:6214:c6b:b0:89c:806c:93 with SMTP id
 6a1803df08f44-8ccefd8d38cmr7411286d6.30.1780073204501; Fri, 29 May 2026
 09:46:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260529-bb-setup-override-improvements-v1-0-91db62e0149e@toradex.com>
 <20260529-bb-setup-override-improvements-v1-1-91db62e0149e@toradex.com>
In-Reply-To: <20260529-bb-setup-override-improvements-v1-1-91db62e0149e@toradex.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 29 May 2026 18:46:32 +0200
X-Gm-Features: AVHnY4LUNmkw8V2qeOPTeYd7KVoZcdvgy_ndtU9ulLPwENikSAT4Mz9ngQ-re1I
Message-ID: <CANNYZj_iZGyJQo-OrTXfH1rBSxtrQtOcCT9Mfnb3uiBJpwQL3Q@mail.gmail.com>
Subject: Re: [bitbake-devel] [PATCH 1/2] bitbake-setup: support multiple
 source override files
To: ernestvanhoecke@gmail.com
Cc: bitbake-devel@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>, docs@lists.yoctoproject.org, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 29 May 2026 16:46:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9543

On Fri, 29 May 2026 at 16:52, Ernest Van Hoecke via
lists.openembedded.org
<ernestvanhoecke=gmail.com@lists.openembedded.org> wrote:
> The bitbake-setup documentation currently states that:
> "The --source-overrides option can be passed multiple times, in which
> case the overrides are applied in the order specified in the
> command-line."
>
> However, this is not currently true and only the last --source-overrides
> argument is actually used.

To be honest, I'd rather fix the documentation, and avoid increasing
code complexity in the lack of clear use case. It's always possible to
merge multiple jsons into one with a simple python script. This would
also keep things consistent with the 'multiple sets of sources in
json' idea, where you'd only pick one of them.

Alex

