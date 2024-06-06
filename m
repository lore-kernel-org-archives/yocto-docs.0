Return-Path: <michael@opdenacker.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0873C25B75
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 13:27:52 +0000 (UTC)
Received: from sender-op-o11.zoho.eu (sender-op-o11.zoho.eu [136.143.169.11])
 by mx.groups.io with SMTP id smtpd.web11.14439.1717680464418790711
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Jun 2024 06:27:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=michael@opdenacker.org header.s=zmail header.b=NhsUPLjf;
 spf=pass (domain: opdenacker.org, ip: 136.143.169.11, mailfrom: michael@opdenacker.org)
ARC-Seal: i=1; a=rsa-sha256; t=1717680461; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=fgFZbzFgqL0pQBkrtIeFR8XhVQ9RwQOJqAGV4z2iF6VR/ocIolUZ5jV2BnL3NYDSFMmHa0CwJVKIGLin9qz4IM1HAfh4xRoODl3jK7i3w/p3fG/kvAJxhMnlXlevz5lYvLJO1cyOfXOdsKYPIUuUfiN+39o/3TMVlZbCV9ms2S0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1717680461; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+xE/2C6tjs4BOi8ts5HymXvrWXEdUEWNf1HRjm4gI3Q=; 
	b=F4Sc8X7FlWrqIlCUz6OzujaiWJdbvGEXZHASgAFDy8IJtqzKvnaiH0x0zH05ox0v3LSpVx06xuKJxOvtU4Ua5/S4Wwj6uJlnt7aRXrAy8NLkng8ich6nulDDnrvxeBo2K1EhLnb/SlRGGPL4qVEd/WXymgsVSmXwdYP9utkDUdc=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=opdenacker.org;
	spf=pass  smtp.mailfrom=michael@opdenacker.org;
	dmarc=pass header.from=<michael@opdenacker.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1717680461;
	s=zmail; d=opdenacker.org; i=michael@opdenacker.org;
	h=Message-ID:Date:Date:MIME-Version:Cc:Cc:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=+xE/2C6tjs4BOi8ts5HymXvrWXEdUEWNf1HRjm4gI3Q=;
	b=NhsUPLjfv691/g9y5Xe1nC0S64cmF0Wz9p+278AFT0XGsXARLQSkwczw03a1bhmd
	nUmCxaspaGNK9qwho+ztuY4IwfMH4uyA5ChzUKeDmscix6jAUZlAs3xIX+IuDzswsww
	BSSENLRRvNVhZlv+cIGAccbbs0qQSlE8y9eL453U=
Received: by mx.zoho.eu with SMTPS id 1717680458866375.30904986950964;
	Thu, 6 Jun 2024 15:27:38 +0200 (CEST)
Message-ID: <d9f11870-8eb1-43ce-90d3-2d6f33be54e8@opdenacker.org>
Date: Thu, 6 Jun 2024 15:27:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] migration-guides: add release notes for 4.0.19
To: Lee Chee Yang <chee.yang.lee@intel.com>
References: <20240606013102.1462801-1-chee.yang.lee@intel.com>
Content-Language: en-US
From: Michael Opdenacker <michael@opdenacker.org>
In-Reply-To: <20240606013102.1462801-1-chee.yang.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Jun 2024 13:27:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5274

Hi Lee,

Thanks for the update!

On 6/6/24 03:31, Lee Chee Yang wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> add release notes for 4.0.19.
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>   .../migration-guides/release-4.0.rst          |   1 +
>   .../migration-guides/release-notes-4.0.19.rst | 159 ++++++++++++++++++
>   2 files changed, 160 insertions(+)
>   create mode 100644 documentation/migration-guides/release-notes-4.0.19.rst

Reviewed-by: Michael Opdenacker <michael@opdenacker.org>
Cheers
Michael.


