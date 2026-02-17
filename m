Return-Path: <daniel.ammann@bytesatwork.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6ECDE63F2C
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 07:59:44 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7743.1771315177537079383
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Feb 2026 23:59:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bytesatwork-ch.20230601.gappssmtp.com header.s=20230601 header.b=U9KDDtrW;
 spf=pass (domain: bytesatwork.ch, ip: 209.85.128.43, mailfrom: daniel.ammann@bytesatwork.ch)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4837634de51so12691715e9.1
        for <docs@lists.yoctoproject.org>; Mon, 16 Feb 2026 23:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20230601.gappssmtp.com; s=20230601; t=1771315175; x=1771919975; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:content-language
         :to:user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KHEEuruEi4DToKEFBfuB2y65LPnyAJn7VjwbAogjK4=;
        b=U9KDDtrWhM1Ako19AKsUO4A6JndjuR6K1xRXwZIxRdnXre2k/JP95ta3ZcZ1fQyI5d
         MfZn+NC7NFe9KKrugzgcmMOfcjPhiSk5E3MKnoqaBCq4zn7xUbyCwYI3/5oeBBqzskHM
         sptLlpiefs4qWi6sE3X8GoeZHbeSxTrRKKSykh8zFGsmstNyjFuGxbWCi+TGTFOtH9Gn
         OZOdFbY0l95vApmiR+Ok+qKVwbeLdB4ucTDhaB83cGgcGSYiID8RCQ5+d7KPsKhev955
         l5Zg+xwN/p+uq9nrBUZszEY67nlaTY/B8rafaFTFK1qoKs3AT2q9NskR2SqxNFHsxlb+
         9s+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771315175; x=1771919975;
        h=content-transfer-encoding:autocrypt:subject:from:content-language
         :to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7KHEEuruEi4DToKEFBfuB2y65LPnyAJn7VjwbAogjK4=;
        b=Lbxt0/D4UQ0DlHcw+hpXoTvR7j0fdSgPsX2aAQxmUC/oa8Cbp4MavL4ddgk4RpJUCw
         RFawVo9o7yD5c62W44wbv5SukDVZXh46SeD3/t/DR+wwj97vJkNh7lrsLW2asxb+NQrz
         r9YzD4mAH8a0boM9wWhTFo9ygiBcIH73TGzAdLujBE7jifKAcHdRYC59z00SAbfErEpm
         u6NPuzhJt9emx5uAOj0h6pIN4HJp7n8pD1VSYk0V1CPkUsXzWEct2PbqvdwFyHDvbfbe
         jfLGpLsCz7YaLiaSFlCMiXb2E1FeW4NmbchQzFRmQ1E/g8Bud1As+Pjlb53TMfxRWrN4
         AmPQ==
X-Gm-Message-State: AOJu0YyZdziOcPr8cEcymE87as10eENToMNouiUwT1CDrq7gr8zH8Dw6
	I/1SSULhotPpl4bJwUm32DaL0kWj8dyvnfbiRr3frcK4WzFyJfJpkDJ61td27NcFt7WkgTW9sCJ
	FFO/qcK0=
X-Gm-Gg: AZuq6aJOOEqkITo5Qs4F6/ZOXhZjrgdHBiGOjLPJdEUse6y9OrmbYwiYqCUIu6aoqs8
	76Vmj0fkyqkgW08PBL0HqzxHyBSEQsbiXkMgF9GQK94oRFPaNvHAqmbcRmD9nOwg1w5Rbt6VLiV
	nnWhjnfY9DpUfQ/7fTAkRbL6a37Tnih7jpxyOit8SHWxVsqonOK0MjuMsLTbzwg9tSzYdebDKBX
	S/dD/Fs2apJYCF8W4e/KYWrx5fjBzrfPkuRn17d9MGo12IEamOIDuKHdzjeh1RzVf+zUNGrE2z6
	s/B7utwEQqZZ3CIISi5DDDU6oC3ldCkoEoW6MnTgxZDqqPlnR38odZhGy2TQpAWQgKmNaVZ4QE3
	h6EpH/6M/phCyHng+2lN7lVufwplzrMa1VHpqE6JrJWdDoQtgROgFGFn8tOLGD1n6vr26vQOpm7
	7ekrAp5LQZh1dW8m5FWj7INrPWwiw8dWrItOo7KixbqtSeaBtHiok2RzjhPbg0nieDRbo=
X-Received: by 2002:a05:600c:1991:b0:480:1e8f:d15f with SMTP id 5b1f17b1804b1-48371043dbfmr219155415e9.2.1771315175448;
        Mon, 16 Feb 2026 23:59:35 -0800 (PST)
Received: from [192.168.2.42] (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a2392bsm191114215e9.6.2026.02.16.23.59.34
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 23:59:35 -0800 (PST)
Message-ID: <d8d48a98-edb6-4e30-a49b-0a9b52b14216@bytesatwork.ch>
Date: Tue, 17 Feb 2026 08:59:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: docs@lists.yoctoproject.org
Content-Language: en-US
From: Daniel Ammann <daniel.ammann@bytesatwork.ch>
Subject: Links within 'Mega' Manual?
Autocrypt: addr=daniel.ammann@bytesatwork.ch; keydata=
 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
 cZ+2nBA=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Feb 2026 07:59:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8930

Hello

It looks like links within the 'Mega' Manual do not work.
E.g.
- Go to https://docs.yoctoproject.org/
- Switch to the 'Mega' Manual.
- Click on one of the links to within the document (e.g. "Build Host").
- The link is now https://docs.yoctoproject.org/singleindex.html#document-ref-manual/terms#term-Build-Host
   and doesn't work.

I tested with firefox and chromium.

Kind regards

Daniel

