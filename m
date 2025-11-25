Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD91BD0EE06
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 15:47:38 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.452.1764085649967650259
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Nov 2025 07:47:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ffku2TlF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42b32900c8bso3323532f8f.0
        for <docs@lists.yoctoproject.org>; Tue, 25 Nov 2025 07:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1764085648; x=1764690448; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pBcZKRWeQbfkWKlQ9qoRsiweKBs5KpBku6L0ykAJ33o=;
        b=ffku2TlFnUFBVP+kV7scKzM9LMiWf1Vv8KstyJEczitfRle6YMV+NN0Pp2tPnV5zgF
         g1DiCbHP17f6MoFbDyuz42vs2vP2mPV3WgH2EszTdY9H1FsDNdy97LBR/Q1i6cPr/tcN
         gZJkN/0BCeeKv6/Pn6v27ZxFm0RvpC8NQsU/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764085648; x=1764690448;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pBcZKRWeQbfkWKlQ9qoRsiweKBs5KpBku6L0ykAJ33o=;
        b=w9+6gWofy3dmfc+TheoPA5EwwfK6UT2JFgx8+LsZvcZyGBan9ls/QNG2xQMNPTw1vC
         8oeOipEG5hvoLtusKUCtwA+aJ+qFQ1XXPqk7aVRKJf1YkRlWH16adDBB1Q1T6U278dKT
         54EYtNeAUrUPVT+Yu+JPBjfGS38csH9ptVhqouJS6z6lPCdcb24Of4YhlGQ25zRILsZr
         dkf8QWd3Jcmj8a67PZMhUetasxv7atx5lgMBhZ1hCzHEybb/5luT1vkFJY6U0Mxt+fDD
         EuGFtjwXpd4E6fSEYj+Rj4Gh4FK/O82GBq76qAyITGbXgA6Mz5iI4OHqY5+3eLzwcQ9R
         T3rA==
X-Forwarded-Encrypted: i=1; AJvYcCWorYm5Rsxa0B6VXI7jo7/9YNut/yrdcawowrRdo+1L9BIp3hkf2vlqZelQOqJX7TYj81FU@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yzi/G1HZSKIUc2VTm/FsdCT+aEUHIhrf5afrHGL+U6qFtH8I7Hp
	N7u44OhkfucrPwAb9y1b3KtreO9VGD3v0+QMRkJH9SGt9U0l4eSsIhRKpYYTULTUlJhaYai1exK
	m0UwO
X-Gm-Gg: ASbGnctu9e0xBr8G6NKyLNKbmvWKl4EQHjAW4bQH0sUjq5a1LUEoBXJUcZ2PsFktGUg
	vLmIYJJwwxLv7BSk2O0stIzMQdhQmErTkh2hBp/YCBttsluEMOhT1TSC40IiyHzB54wWT7wGWRI
	apd9VaufdY/g3be1DSToYuhBB6GUGq5NDHUUJbv1CSqlgECqf5e/BUun4whvuhRtoekHR7Hi2gJ
	OjDyNwJEZRDfEH4Sdx8qfWgUwPEZBtUR98Sy5msgzWRzE8G6zkbdLzFOikZQG0Gp+d6JE3FkbHi
	2ooeBjDar9o1GGr7ZSbOx0NaMqulYR8Lz31E8NgefEESDEqqiI84xQNH2wmg1qj+jPlj9B7/rCe
	IaASW21Ne6PLECiPwRytcb2iWt4YsiOkCMJNbk/UGbSadPA0cTx719ZF9eOxe4kx8UnnFxzCL1s
	to6VzYMgH4u/FnUWymsxgfV6V+fybhw7PRUo9iBgFVJNzIv3+CU21i4jjhc/O8
X-Google-Smtp-Source: AGHT+IHPBG8T0T6NLe+33qh3sNDr5p4SyU6aQiR+H9RA98oeOr+vf+R2ioiE7yWtdsDV0Kspl1UOLg==
X-Received: by 2002:a05:6000:420d:b0:42b:2e94:5a90 with SMTP id ffacd0b85a97d-42cc1d2e354mr15989454f8f.36.1764085648200;
        Tue, 25 Nov 2025 07:47:28 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:c8cd:1015:2ce5:f243? ([2001:8b0:aba:5f3c:c8cd:1015:2ce5:f243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fb8e62sm35026726f8f.35.2025.11.25.07.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 07:47:27 -0800 (PST)
Message-ID: <90133708303aa9fdb7d2bc0cbe3c70aabfc3f3a0.camel@linuxfoundation.org>
Subject: Re: [docs] is there any value in a short section somewhere on H/W
 bringup tools?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, YP docs mailing list
	 <docs@lists.yoctoproject.org>
Date: Tue, 25 Nov 2025 15:47:26 +0000
In-Reply-To: <8f9e9bb5-e84e-c9a2-bd27-105ffae5c2e8@crashcourse.ca>
References: <8f9e9bb5-e84e-c9a2-bd27-105ffae5c2e8@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Nov 2025 15:47:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8122

T24gVHVlLCAyMDI1LTExLTI1IGF0IDA2OjM1IC0wODAwLCBSb2JlcnQgUC4gSi4gRGF5IHdyb3Rl
Ogo+IAo+IMKgIElzIHRoZXJlIGFueSB2YWx1ZSBpbiBhZGRpbmcgYSBzaG9ydCBzZWN0aW9uIG9u
IHVzZWZ1bCBPRS1hdmFpbGFibGUKPiBoYXJkd2FyZSBicmluZ3VwIHV0aWxpdGllcz8gaSBqdXN0
IGFkZGVkIHRoaXMgdG8gYW4gaW1hZ2UgdG8gaGVscCBtZQo+IHBva2UgYXJvdW5kIGEgbmV3IGJv
YXJkOgo+IAo+IMKgIElNQUdFX0lOU1RBTEw6YXBwZW5kID0gIiBcCj4gwqDCoMKgwqDCoMKgwqAg
ZGV2bWVtMiBcCj4gwqDCoMKgwqDCoMKgwqAgZHRjIFwKPiDCoMKgwqDCoMKgwqDCoCBldGh0b29s
IFwKPiDCoMKgwqDCoMKgwqDCoCBpMmMtdG9vbHMgXAo+IMKgwqDCoMKgwqDCoMKgIGxpYmdwaW9k
IFwKPiDCoMKgwqDCoMKgwqDCoCBsaWJ1Ym9vdGVudi1iaW4gXAo+IMKgwqDCoMKgwqDCoMKgIGxz
aHcgXAo+IMKgwqDCoMKgwqDCoMKgIG1kaW8tdG9vbHMgXAo+IMKgwqDCoMKgwqDCoMKgIHBoeXRv
b2wgXAo+IMKgwqDCoMKgwqDCoMKgIHNwaXRvb2xzIFwKPiDCoMKgwqDCoMKgwqDCoCB1c2J1dGls
cyBcCj4gwqAgIgo+IAo+IG1pZ2h0IHRoaXMgYmUgc29tZXRoaW5nIHRoYXQgd291bGQgYmUgYXBw
cm9wcmlhdGUgZm9yIHRoZSBCU1AgZ3VpZGUsCj4gb3IgYXMgYSBzZWN0aW9uIGluIHRoZSBkZXYg
dGFza3MgbWFudWFsPyAoaSdtIHN1cmUgdGhlcmUgYXJlIG90aGVyCj4gcGFja2FnZXMgdGhhdCB3
b3VsZCBiZWxvbmcgaGVyZSBhcyB3ZWxsLikKCk1vc3Qgb2YgdGhlc2UgYXJlIGluIG1ldGEtb3Bl
bmVtYmVkZGVkPyBJZiBzbywgd291bGQgYSBwYWNrYWdlZ3JvdXAKdGhlcmUgbWFrZSBzZW5zZT8K
CkNoZWVycywKClJpY2hhcmQK


