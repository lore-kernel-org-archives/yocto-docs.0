Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8503D2CDFD
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 16:17:56 +0000 (UTC)
Received: from cockroach.ash.relay.mailchannels.net (cockroach.ash.relay.mailchannels.net [23.83.222.37])
 by mx.groups.io with SMTP id smtpd.web11.22590.1729613873342253271
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Oct 2024 09:17:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@rootcommit.com header.s=hostingermail-a header.b=KsOc0qkM;
 spf=pass (domain: rootcommit.com, ip: 23.83.222.37, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 5EF8A86762
	for <docs@lists.yoctoproject.org>; Tue, 22 Oct 2024 16:17:52 +0000 (UTC)
Received: from uk-fast-smtpout10.hostinger.io (100-99-180-59.trex-nlb.outbound.svc.cluster.local [100.99.180.59])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id A28F88682E
	for <docs@lists.yoctoproject.org>; Tue, 22 Oct 2024 16:17:51 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1729613871; a=rsa-sha256;
	cv=none;
	b=8AbCStY2bIYuoZh4rf67jw46F/3+h2QyLYbJekPOvk08V932tj68cZvVOWuSWiimwTO06g
	1EdhoAew+Vo45UuUiEVd2nw48ALpqDS0eMJTRbghXCxwvGJNZx9zpMdCuBJomCO/VTSSla
	jMAGFG56xBoiDWz7hxC1UFEG6zbZCKJgRqW54raXqk/S4k8Z+zCQzB5jvyUcRMuuwDntH0
	IlVXL7+ywg28DEUwLSGwWLpAH+J//CbHrisx1lV8lJ9/h4YWSgbZJubysP8MUOaZry5a5h
	TYYlKKAVvGO1cZn5mYAcV/fk25o0e/xNwLGr6aLhHEzwxMsRDTVlAE3U+Wh4HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1729613871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=sJVEY1UgAZMllNyOUeELxABXfnWH1PWOmb+RLJHC5Fs=;
	b=FBwituaMwfIBaFr0EltbuGs72hzL52esT4cAFK9HaFoUYRLCpR+TpenWfTiaWmjihz/MPG
	cZ9NBWW5jZfdYgNV+Ru2OwyH+H3/uFKRjYquyZU/EJp7lgNeC5HZfLsEToEQrL56FzVI8e
	1iRGW4RrhqDob5Dh4hOD0TXW9Nb029SFXGO4uTbznrgru2tLeX1G26yodN3e/oc3VA/SPq
	tUchrKTImuMq+NGGAh7mYZ6YVToInVSL8/9sNKyWSjQTAOpshgsNYNFGAtGKY7bmqFDJtV
	BbS1lRNXY3AEEjLPq8TDd1Snshhb9E+WZgwY0UpK8RVh/Q2xeiisskM2wbByew==
ARC-Authentication-Results: i=1;
	rspamd-5855df8995-pzk2h;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Bubble-Well-Made: 21ee4263553bb07b_1729613872149_3886061342
X-MC-Loop-Signature: 1729613872149:3062533016
X-MC-Ingress-Time: 1729613872149
Received: from uk-fast-smtpout10.hostinger.io (uk-fast-smtpout10.hostinger.io
 [145.14.155.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.99.180.59 (trex/7.0.2);
	Tue, 22 Oct 2024 16:17:52 +0000
Message-ID: <36a47a8c-49e4-4881-b1f4-a20422260086@rootcommit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1729613869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sJVEY1UgAZMllNyOUeELxABXfnWH1PWOmb+RLJHC5Fs=;
	b=KsOc0qkM2uQSxyA3Fq+wK7NULzPAf1//NgVhHyrGhLq7RVaoFCrj8hM5Xv964DotIdnz3J
	h8O6DqibpEqM1XYmkA3WdQnvmkG21W76nb4OUhvveruSeO4M7icOIm6d29nyIo7rrVH9UE
	fPSGEvQ8Ekx0qoWGw1GOzw0qoOajW0VNDMLze9vQ+FfB2+IC6gFPY4NkyfUuftmWRxrrVy
	aDavwcxZ5FQnDzIkoFaVAtbq2KtWyxlj03LTQFczqZqfhyoo2qnM9449doaJlLhRaV9otJ
	IiB3mdM1X5+IsNIyWGE6TtT01enhxvae02V/BgFViYEc85gAarJ32FqsZQCLHA==
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 2/2] ref-manual: release-process: refresh the current
 LTS releases
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
References: <20241022-update-releases-svg-v2-0-6e7740f9a41c@bootlin.com>
 <20241022-update-releases-svg-v2-2-6e7740f9a41c@bootlin.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <20241022-update-releases-svg-v2-2-6e7740f9a41c@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 22 Oct 2024 16:17:49 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=TcnEtgQh c=1 sm=1 tr=0 ts=6717d02d a=izfhc+EirUGy/1yDy2FURw==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=P-IC7800AAAA:8 a=d70CFdQeAAAA:8 a=7DBlWvntW-TTjnd45W8A:9 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfOYpL3npuYw0SbCX71PEXFmSNs9biro7e09avWtNN/BSQkHGqyDKTZ4DCT3A8KlQfzREykUh6i4vyk/uE2rfbxEUuh/XvcNVdt7dE9YwTQs5ESJJ/1K5 d9hRwY2hGyfKfwYB3GoWNf5B0lyryPR/fuJzWvyWLK5MZLB/4v/mt6ZiBeCizM4GEAbRFd5f4S3rXxfrXwhBUk27OCLuwn22XxRNxqoVT2OPQufGWRVWAg/o 1i26kp/z64RGZk/fk5aMM5+D1ifi3aweIrtMUff9HOFwtL9rQOyU5a8oh2XCgZ9kAFlr3kbChFhvRtb1tQ68P/SX2lyfkdIv7FlO0lEvT70UDPqyx2rpqmjP C1snasafq3PmEqEc6ch7PRNdtysuWINq4hWsjKkJ7Rg4kz06GoT2Ajp9/NU8kLV71hM2mpgLq7H0vhfpzQw/IXBdVpskDVI3of2X20/mIJv3sCNi5ymcyxpM /FTjVVZgL/ejOYdWzFcVheF6+swMbQqNqvFLAw==
X-AuthUser: michael.opdenacker@rootcommit.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Oct 2024 16:17:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5569

Hi Antonin,

On 10/22/24 13:03, Antonin Godard wrote:
> Mention that Scarthgap the latest LTS in a bullet list next to
> Kirkstone. Reword the parapraph a bit to make it clearer after this
> change.
>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/release-process.rst | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
> index 920794679d2256cf0f8e9677c7739e5540c4bdd4..75532addbdcd52cb0ab13ee8ffd57a70e1fc8045 100644
> --- a/documentation/ref-manual/release-process.rst
> +++ b/documentation/ref-manual/release-process.rst
> @@ -103,13 +103,16 @@ have reached their End of Life (EOL) won't receive such updates.
>   
>   This started with version 3.1 ("Dunfell"), released in April 2020, which
>   the project initially committed to supporting for two years, but this duration
> -was later extended to four years. Similarly, the following :term:`LTS` release,
> -version 4.0 ("Kirkstone"), was released two years later in May 2022 and the
> -project committed to supporting it for four years too.
> +was later extended to four years.
>   
> -Therefore, a new :term:`LTS` release is made every two years and is supported
> -for four years. This offers more stability to project users and leaves more
> -time to upgrade to the following :term:`LTS` release.
> +A new :term:`LTS` release is made every two years and is supported for four
> +years. This offers more stability to project users and leaves more time to
> +upgrade to the following :term:`LTS` release.
> +
> +The currently supported :term:`LTS` releases are:
> +
> +-  Version 5.0 ("Scarthgap"), released in April 2024 and supported until April 2028.
> +-  Version 4.0 ("Kirkstone"), released in May 2022 and supported until May 2026.
>   
>   See :yocto_wiki:`/Stable_Release_and_LTS` for details about the management
>   of stable and :term:`LTS` releases.

Looks good to me, thanks!

Reviewed-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>

-- 
Michael Opdenacker
Root Commit
Embedded Linux Training and Consulting
https://rootcommit.com/


