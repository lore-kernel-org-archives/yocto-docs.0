Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B14AC28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 14:05:27 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.80])
 by mx.groups.io with SMTP id smtpd.web11.11932.1743170723791733812
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Mar 2025 07:05:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Rz1pM1ki;
 spf=pass (domain: cherry.de, ip: 40.107.22.80, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yXXP5O7wEJ5v9D2soo4Aei2JyNjVWp417ikx5pDhJtqXavSAuA5KwfqrLwmrcHRF0dHpHxMe9y+pJKxBgsphXzfcvZium/mfT9rdpGZ+9yJv4hs1dOTG+wsIb6zdY5CO15yxxEm/5HiBUryvKizYZ0e91rLtUy+uijhk6aKpTRuzS5fC4oNlF2OkCG2ZOEAtlWeYHqRYWycVmna0Sdkd7YseEMo93NnmAEMS/Hgyt08uNazHv/BKs1IDwf6mhDPJE3L2m4xP5S6ZB+RogJov5KlhHcDdbN0vSuGatJ3M5DZwRIwmptlsyjeeVq4kIPAnDRNEq8t+EE3/KvpQyp+NHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vOVjIZiMDX7d+Mi3XC+8EmORgv420bZS50sj4fLHo/k=;
 b=kIttpSaZHWDSpyclUeV7SKnom0Xs6idNkN5D1b/3/CqaYbHDMyrPse7+T9YiptGM54cgcBgPKACNR8kVOL8Nuvn+tRTLxneKlJVh+lDW4XMNvagC0Z6Xx0dHYw0bhKeCFhdskWUfVtU5gdHWhTdptu7lcKiKjQmuV4sdsyXiINHmSgK0K5gaUGArX2NoSsNgB07whplHVknmAxn+x5iuKtyJes7u648IpgvRyVRGU8WGNykgHCFKl4DI1LmYo8xp+2JhaX6ZCFwnEXT07I6sm7FJbDd5qHOgnqZYpFj6UyoEGIJwXExjH87BnKXCYMg/pfebO9HG39kx9Mb17lWhMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vOVjIZiMDX7d+Mi3XC+8EmORgv420bZS50sj4fLHo/k=;
 b=Rz1pM1ki8fnTcqxDLi1cv21RGfAUpBgYcec5c9hZvKu6USLDZVmlDzC87BNOMqUcAgeShserMyBZzP7XsnV1Fow3VCUNj/G+wKNBWv05R8Wwf+wms2eIlE/QIDkRoYI0n65Zq6D2vm20YOsdzPr2N0/LOvLSwCkXWso/1/6UlUI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA4PR04MB7677.eurprd04.prod.outlook.com (2603:10a6:102:eb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 14:05:20 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 14:05:20 +0000
Message-ID: <ce5d2a20-44ea-4540-b726-9f35a95bb8b6@cherry.de>
Date: Fri, 28 Mar 2025 15:05:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 03/12] ref-manual/variables.rst: document the
 WATCHDOG_RUNTIME_SEC variable
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250325-release-note-5-2-updates-v2-0-19f050d61da3@bootlin.com>
 <20250325-release-note-5-2-updates-v2-3-19f050d61da3@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250325-release-note-5-2-updates-v2-3-19f050d61da3@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0035.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::19) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA4PR04MB7677:EE_
X-MS-Office365-Filtering-Correlation-Id: dac9b71a-6a9a-4683-c923-08dd6e01938f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?b1hIMHJQVXl1djdQNlNOQUsxc0kxcVJCZEx1NG4xbjE3UEhJM0NycWY4UXZO?=
 =?utf-8?B?YW9kbWdDMjZDdnI3QUcxVGhoRC8rcVlzQVZWQy9zeDhYUnlLcUxyYlFVNTlh?=
 =?utf-8?B?VFB2RHZQSnk3RzR2RmVWL1QyQmN0NkQvQXpreHhLc2RaTUhLNkJUYjk1QmNM?=
 =?utf-8?B?eDliaTVxbFhwM1Bpd2dEZEFrTDNRRitwU05XV1BPcjhnWXY1WEgxajlSMlNP?=
 =?utf-8?B?YkNPY3NXU0h3Y3hGSU9nSVc5QWlMQ21TSTZDaUN5Mjh1SFp0TkxIRy9ZaktX?=
 =?utf-8?B?WnhGS3AvbGR0SS9odlpkbW15V0puN2FWOEhiTUFlYkIwSnh2aFQ2a2lzTWdw?=
 =?utf-8?B?bkN3eFVON0hPQ0FXWk1GYWVjRzYvTFlhVmxreEZRZXIrVUQzTDcvZzZOQTV2?=
 =?utf-8?B?T3BFWE9LdVgwckxnRDFJNGJmZC82YitUOU90L1RyN3dBdnI1bnBqeUVSMDFR?=
 =?utf-8?B?Zm9VZC9WRWJ5dVZOQ2FWVHNhUW8xTGRzYjE4QmtrUnltNFFVQ1dWSzR6WHVC?=
 =?utf-8?B?ZDdQVDlxNzR3R2w2YzFSMVNuenc0TFdneGp2SmV5R3hJZFl0R1IrNUpoTzFZ?=
 =?utf-8?B?Y0N3MWVUNUp2ZXhGWTVKUkJ2Y1o0Sjd0RVM1WFFyU3Z4K0lnbzQvNUJzRjlI?=
 =?utf-8?B?dlVKU3E2WERsOFhuMGpyMXpyZWtRZUU0K295NHFMK3R3MnBEc2d3T0lCOWpZ?=
 =?utf-8?B?bFA1My9ITW0yOHFDeXF5bmNnc096aW1mNlBLUTNhS0U2bEVuNHd5VlRIeUo0?=
 =?utf-8?B?c0Z1ejV5aFNvQXgrNUNCSy8xOTNZeStBeGZoOFkxVXR0bWpnR0JqSUlxdjk1?=
 =?utf-8?B?MXFWcG1FSnI1WXBUQW9oRzMrc0Yvc1FGZndUeXFWTHZIcm5rRmhYQW0vdDlr?=
 =?utf-8?B?R3N1SEJqdmlnelQ5OFVxZzNINEhiVWRGZ3BvTDUzOWpQZmVIdHlEMU9DaC9H?=
 =?utf-8?B?VThKS2tJN1ZPRW8wN2VMK0p2TVJ0ZFd2Ti9pNkFiRW5EMFdwa1N6NzhqTEJh?=
 =?utf-8?B?M1BVV0ZMYUtRbHBLbWNCR3lUcGZ4Q1FqclozdDR1a0ZWSndaSTFxT1ZOYUZX?=
 =?utf-8?B?M0xWekhkTW5SbjYrMzc3dmxXeEpORmNvdURvMm5WeE9uTjJKTC90VGtDVEdk?=
 =?utf-8?B?bElmcmtZUXpPTVQzTFhLOUxMZEZzV0FHNmFrWDZmdDVxRmlxK0k2VEhHWit2?=
 =?utf-8?B?ampNcFJscmVSdmdJNGhCWUE5eS9mYjY0eUNNN0NYeEpqVHE2STVlRWs4YVA2?=
 =?utf-8?B?WnRjZU91VEpid3ZpWmlSMTNLMWpkekN5WCtXWWNHVk1lODR4YmhaWWU3dG9P?=
 =?utf-8?B?SGZXNVhYcnhkV1VkeWFPNUFaamVlTzY1RkJ2WG5mb2h0aDlYRllia1ZTRHRO?=
 =?utf-8?B?TlYzREUyV21lRGFXVE5pQnpyWldTVkNnMlhUTEN5M3FWckNzTnROckNmSXFZ?=
 =?utf-8?B?K2F4N0pUN1VqSVdkMmdNSU1RbkI1M3p3N2p5QVIxL1oxQnd0MUhVNjdrM2ty?=
 =?utf-8?B?dG5jNldOY3R4cGhuMUxLY2JNM3hWYjNTQXp0MW43QzhYYzNTWVN3MDNmNnFE?=
 =?utf-8?B?UFMxMnhwNUpTMGF0YVBlK0RoWkMrUDVQRTJwVk9jZXJiVUx0eVpBU3JiN2Zz?=
 =?utf-8?B?Y3J0VU5QTXlXV051Y3hyYkcyZjYwYTNDVGE2S2p4QTJvL0NKWWoySjRobGov?=
 =?utf-8?B?WFlFdml2L3JteFFyMkFTTTNCTWx1NDdvNXBJUGVZTHhGWHN0cFllU0MwU3hW?=
 =?utf-8?B?MjhtTjhBSStwVG9MRUk0WW1UdVBNWU45MmdYdS8wa3ZxL25CWFNwRGZ0elcw?=
 =?utf-8?B?M1hkdlU1M2ZtWE5OellLQT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?enlYd3RvMXlpODF2bVlMVHZuU2tGN3ZRMHhIVWpzV3hqZU5HeDZTRnBlTU5M?=
 =?utf-8?B?YWp3ZnpaMUgxU0FrMm1kdWpIQkNjM3daWGlhM3FXK2FPOEVyN0FtVHNpSE1V?=
 =?utf-8?B?WmNtMlBmT0gzL01pbjVDc0hONUlXOEdybVF4QUpVejNZN0FONW9GRGtxY3pw?=
 =?utf-8?B?N1I1WUY5WVRBcUNmK2lCd0NlVlkvR1V4MUpmejl6UW4vVjJFaGJERFliMFVk?=
 =?utf-8?B?NGRLZHEwbnFMZHc1a2pUTTYrb08rendnNkJ2WW5SVkpZQStwQ2oxV25mSE5u?=
 =?utf-8?B?ODdDM29nSW9rZTlOY3lULzZpYXg3NDZGUklaQzFQS3RzN0JReFJVeURHdzlS?=
 =?utf-8?B?RjNScjZwa09PSktLVkt2WWExK3FZVndLZkpMUDVBL1R0K0FHSkkyQlZORWFy?=
 =?utf-8?B?ZS9lTXZRL3RXMStEN3pQanpZMTV0aHZocWpxSUJiWDZ0Tm9ZRzNYNUxSRHF3?=
 =?utf-8?B?Y1A4U3ROVHVnTllkRHhDQWNKeDh2UGN5V1c4TVhWYUtxNWRaVmNlWDMvak1L?=
 =?utf-8?B?aFk2U2k4TUppNG5ncmpFVDg1bzN1MXAxcXU3cWw3UHFjZWRBVVRIOVJLcE9k?=
 =?utf-8?B?eWtrUGhNWU5aUmdlUnhMd29jcnV2WHVESklvWS8yRTlodTlUQWtoMWlGU3Av?=
 =?utf-8?B?b0I2M3BGTEVDR05IOEc1ZTh5eUhuM0RyREl4ZTZpRWE4Y3JRbTdtcmFkTVBo?=
 =?utf-8?B?Sk1zZFVZOTZxQWRQdTlJeFpXOW1PWjFCSUthT08zck9pK2luT3gzMTV5TFUw?=
 =?utf-8?B?aFRYeDNWekpxZzNnY0E5OTVKVGRkMDhqNWsyR2ZYTE1ZWWZBWU43bnNaa0pw?=
 =?utf-8?B?UFFMcytzWEJEckRValFuQXQ2OVRBYU1iUDMwU3pFbm1FUTRyd2N3UXNNWngr?=
 =?utf-8?B?dURCZzZXeCtxU2p6WjBJaUNlVVVDeWJWdDJUTHc1U0orcXErbGpSdVBReEh5?=
 =?utf-8?B?aTBRTkVkL2k1ODVaVEpKTXorZlJQMkpZTUJ4amwrZm9qOTdVamhUaXVDYnFO?=
 =?utf-8?B?RzVMVDhoemhLa1oyMS84YnA0R3NsUnd6elNKYTFUcUpESHVvNjVEbWVUb216?=
 =?utf-8?B?VS9TUW1Hbithc3U4S0dZSFZMQkxQRUtDdUZrR21KSDNBSUFMSEw5OVdmNHdZ?=
 =?utf-8?B?dHhrMkp2WHR4ZmxYWmU1UnpDWThaajdTaUhGOGlIS0ZRRHFVS0pGcWRPbGly?=
 =?utf-8?B?cVBCc1ViQjczTjhpcS8yTDVYYi9TUFgrQUhoV2FadCs2UFE1Z0lXWDduNWRm?=
 =?utf-8?B?TE5QMzZYUjR2ejBZeWw0VnZqVGY4b01Sa0xoMDdMWDl6alQzTnNOQkZoM3Ni?=
 =?utf-8?B?OVJOZlZvYTRNaTdLYTdzQUdBZExJLzN6Z0k2ZE9LcTNHRkFUMHdaUk1EdkVI?=
 =?utf-8?B?RHNEWWtnc21tbHo2U3RTekVDS1RSNENyRVVaa1pZaWloSHJUUVczdnkyMDA3?=
 =?utf-8?B?OUdSVzNXNElGQklsQ0JvaTlpU3RjUzZ6NUNKOGFpY3BmalREZUVHdC9PU2dw?=
 =?utf-8?B?ZFlSc3NpRTlWdytJYjA3MHdBL0VOZTNjbnU5ZHVwODkzNlkxQk82elBhNldN?=
 =?utf-8?B?ZDlpYnhCdi9mTUVVcERGYzN2NG8yMHI0ZVIzdDRiWHhDWEFLMjhGWU9hejll?=
 =?utf-8?B?RDNCaVE4dXp3eXI5R0RnM3RTZU1oeWVZazhPUGM1dFpwQk9ZL0hzaWpQWnA0?=
 =?utf-8?B?ck82NTZNeXVWazlWUVZXbXpQNDc2VWFUYnBvOE51VzhXZnJxM3U3anhGeEQ3?=
 =?utf-8?B?UVlsRkhYRERBaVJ3MlZuSU1kdTlQL3RlNXRIdEw2YzZubElha0VIcm9MSEFN?=
 =?utf-8?B?TklqaGh6eXZOb096TFdxT0NFSUY5OTJQSkZqU2xWcDlDY2tBNEx4VEVVV1ZL?=
 =?utf-8?B?d2JveEQ1UVQ1WjBXaWtrNElZNW52ay82dndESVpTb2NkZUZLbkdwZXVUZUFt?=
 =?utf-8?B?SmM1RXZsSWRJTk42NTAzVTZ5T09wekpwT2FPckxlTDVmMHBJUDVUN1BuYzhC?=
 =?utf-8?B?ZHhjOG8yaFJRdHpIYVBYQkJnR1BCQ0RDdWs5NE1uRFZYazJ2MmlmVy9NWlZq?=
 =?utf-8?B?aFNyMDh4MCtzeFJRWk9aOHpEY3hWL05HaGpHNEhYTldjR1ZYZEFsVHZ4N2Z6?=
 =?utf-8?B?Vm8wV2p5RGo2Z1lPMDJwOHYrRjZaT0hMUW1hTU5wbGVsR1ZKN2drdCsxam5I?=
 =?utf-8?B?MUE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: dac9b71a-6a9a-4683-c923-08dd6e01938f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 14:05:20.8955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oVxfhWvSpWy1sHN6uLpGuogBcH+aLslfUQTaya8vrOQ6xVAtLXqmIEPK1tKZ6yqvVXWzux0tGE1t0A1EpEh/UQ8j3LvGznESogwa46SavzE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7677
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Mar 2025 14:05:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6672

Hi Antonin,

On 3/25/25 10:20 AM, Antonin Godard via lists.yoctoproject.org wrote:
> This variable controls the RuntimeWatchdogSec option in
> /etc/systemd/system.conf.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/variables.rst | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index ee7244dc5..70ed7db4d 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -10613,6 +10613,11 @@ system and gives an overview of their function and contents.
>         can control with this variable, see the
>         ":ref:`ref-classes-insane`" section.
>   
> +   :term:`WATCHDOG_RUNTIME_SEC`
> +      For the ``systemd`` recipe, this controls the value of the
> +      ``RuntimeWatchdogSec`` option in ``/etc/systemd/system.conf``. The default

How about adding a path to the documentation of that option?

e.g. 
https://www.freedesktop.org/software/systemd/man/latest/systemd-system.conf.html#RuntimeWatchdogSec= 
?

> +      value is an empty string.
> +

meaning it is disabled.

Cheers,
Quentin

