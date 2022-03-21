Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3DB9C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 15:55:50 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.87])
 by mx.groups.io with SMTP id smtpd.web08.37.1647878148856712759
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Mar 2022 08:55:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=YJgdUpwv;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.22.87,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dQDvp1/6db96DVDseaABVu/TnD87eJDnT/drwOg9IVEERmjlTp6mUSoTe29CbdcA+T4pXMxMnq88DEbDnVvUUD6eP5uZdckJoAMe3ZYNolIT9+8GoWFpOBJL98SOjKb9k2x6EQ2/kMFjPyB8/FrnkNyLkq7QVy87C+QgCod6vCZHpJbzLVXEP85td6Q6pZ4psBFb/+1Yt03VHig7si0HExEA34N4qeecXnkydnDZFAIEATDQXJnPfLezAvfU6J/h92PrLJD/2skcm0I1LmdlokhnXZKNgjv+AQfvWn/4DpsqJXGZnPJnKmqLw/tMC0raze9UueV2H/jpY2sV8auklQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vtod9blNfKLQkGUZ6Logn9z1woo+DGIQT5Omj5DCDqs=;
 b=eQUac08M87feIJh7t0JJUiDbLFautHgpbxo6HP8yRADwuo6bb2bE0uQw7m4W81Yp6x9R27CX6NXoHEquBubejxQB5Cajp9f5r+OD8Y3TZbmMXs4Ayu9IJE5axZ7xWZr5502N8GWwdaHf2/DbfnyigvJc0xdhFauUI3TDYr6j/Or0ib6vBjnYj3O9NBZ+u0q8e55QdcAy1qD5pzm71k2FgRgOPRpfZY/TneAx+Mop2oZI3p10LLPmOIDColIe/jQJlWvgmUTkVAw85aAlSdDOy7lPIh1XOYD7Lv0Hf0Of3ISIAwsBUELf9+52YGm3VJ0EOGwUJFoF+gc28KYXqMVe1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vtod9blNfKLQkGUZ6Logn9z1woo+DGIQT5Omj5DCDqs=;
 b=YJgdUpwvIT+vGsZQrIlnfs8ww71gEg5E6Bn7InvbTsv9J9i4oN4WjIgTTLaikTLTpVTz66OPYHtEm/znHX1sEyXcFklP8nWK3LG88tzAn3foAOjh1w1n8PyTKqGIGv6ikjBMWLOeRlcfghq7Q3xhw8YiVc8YO92owcLe29eO5S4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by VI1PR04MB4143.eurprd04.prod.outlook.com (2603:10a6:803:46::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.22; Mon, 21 Mar
 2022 15:55:45 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::1d2b:fd77:d076:a391]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::1d2b:fd77:d076:a391%7]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 15:55:45 +0000
Message-ID: <3140add6-343e-28fd-3d29-d3754bbd33b9@theobroma-systems.com>
Date: Mon, 21 Mar 2022 16:55:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [docs] [PATCH 2/3] conf.py/set_versions/poky.yaml: Set version in
 conf.py from poky.yaml
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 docs@lists.yoctoproject.org
References: <20220318154228.1071136-1-richard.purdie@linuxfoundation.org>
 <20220318154228.1071136-2-richard.purdie@linuxfoundation.org>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220318154228.1071136-2-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR01CA0049.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::26) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8afc9b9a-41df-4ed0-1ffe-08da0b534299
X-MS-TrafficTypeDiagnostic: VI1PR04MB4143:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR04MB4143A4F332F18077D9644E7EC2169@VI1PR04MB4143.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GyCs6tLXk6lw/z7FGAEqBhRKuGS7MD84jhcMwYzB2NIzpBgIsK6vEVAWKkV02qS4XP53dW63hJjddHLosxD5flmK0h+pCiOmqHyJmRcZ7BZsizyAv6RWMc8OXO6fNMe58OHMsMNDpc+X7uJc/RvKMAzumOiICbQgt1/JlepspZCfgVXY7NIeclJfhejpMMQvNgXHSkBBLe7P5AmaLia3PR/Zih5YOXSOENQR2FAlvpmVxka3jq2T4QEa6Ywg9PRhO0oVNs1b+iHMKAEl113H0RSYAsrGEWve1Xnyo+FXz5Nn8yhM9BpOL81pcipYrBxSNEkAgt80xub6azgIKt2GcTFuYt2yRJsYgmWJlZEUkZgNXjGgtg8ccKzrWmR2Asg7zouS6QAJnkp0naH2DXv60XI/yXCe1Gz5B0nixyWL4gmuaC84nT5zEsU/GtTgi5awu9fH73mvj5vTtcLgVyEOBopFArZT05DYslrC1QLslQXV70te057T6kGPwOxNTyK6RbhjLGUB8H5cYXeCleairEq0SUXbJHweXCvDHIPr66FQIj1NLUs9k/mumRF6/u3ZBkKJVggMKb8e8n1PPQGxHaFz4thmfdBctt0r3B6G9o4+ZDajtrCq7zpfFWLj770ywe1qujO2lWAttdhfhLg4UkUutsbUKsV9xT6fB6+rktYTg7CKtiERbA8mTwzUVQGk3lSnolOCBFQ9RmjHBrH0JKn6kniXiREcx9B0lIGX2OlZ98oknqpTrRrw+TtVoRSefg8EYHiUdKFF7qElzTJXINKegqR4/iiTdta14kCgLqOjK4TF96XUzTP3KbEHwhhp
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(508600001)(2616005)(31686004)(6486002)(36756003)(5660300002)(44832011)(316002)(31696002)(86362001)(66946007)(8676002)(66476007)(66556008)(53546011)(6512007)(2906002)(38100700002)(83380400001)(26005)(186003)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bWZpbmw4Qnc5Ymg5UTVBemltWXN1emhNVW94NHVFQ1JqbDVXUUtpSkM1Rkdw?=
 =?utf-8?B?cEk4L0hndlo5cENQemZmNndCU3E5eXdMN1VRWC9jOE9yalRDNHNYaW45d3lx?=
 =?utf-8?B?SlRvTkIwdlVadFJDS3Y2UStTKzVpYlNiQ2lkSmM4NEtURGFna09ZQWtlZW41?=
 =?utf-8?B?OUhMVHFEMk5pdGk4L1ZUZVlIZWZRb3l2TVhBV3RpcWFHT3k3alQ4UzNxa09F?=
 =?utf-8?B?c2hIZVN6c3B2dzlNVTNYaUpia1ptcVVDVGMvdkllRG1HY3doTkVueWZLSVl0?=
 =?utf-8?B?MTVmUndUNGR1cjdEcWxVaUxpQXNmTmRBenlnQldyQU4yVm9wSU5GTkpmUHdo?=
 =?utf-8?B?VG5sY21pSmd2bmZ5TEhCcUpUeXM4dk9aRi92d3RpOTM5VGgzVFpVMkRiWjQ3?=
 =?utf-8?B?KzkwelpuVGNIL3U4VjY0ZjNyb3daQlo1bTNwNUtZbkcvUUllQWtVcTlMWU9D?=
 =?utf-8?B?aEdFOVRlN3V3c1RaUVVEVFhTU0hzVkVha3Fyb2p4dVdrdm0wYThwandKSkZJ?=
 =?utf-8?B?djRDSlNFNjVUb1NwSE1mcGEzQ2ZtYkFTa21mcUlOYXh3eUlSNFZlMW8zTXp5?=
 =?utf-8?B?U2ZZN0ZxbGJaTU8zV0FTMWVjYnV5eXNVY3hTaEVpSk9ZaEc0Znp4ZThuRmN1?=
 =?utf-8?B?a01vNE1xanlqNVRSUEpkVE0zQWRlZkl4YWVmRlNmaVloRmlQc21GT1E4TkJR?=
 =?utf-8?B?aWtuNlpGeUJ2NUtIRnJRc1FyWHowWWt0a0htc05Xd1FDSm96NkMvanRLRUlv?=
 =?utf-8?B?aU9oYkdMS3ZzamNLUkJkWGJrTFJtTk9WUWkwdk9HZE5nZk5pV0VLcGRpbGhG?=
 =?utf-8?B?UWRVeFBBRHdmTjQ2Q3JKOEVVazAxek5uOVFFWWFoNS9BNG9HRFF5blJtaE1I?=
 =?utf-8?B?cis4UHdnS1M2dUFrMDVvVkJMek81ZlBRTmNzVmwxQi9mSVU4ZUFZRk5QUk9l?=
 =?utf-8?B?TktIVVh0alRFYVFWUjNsK3hiSEFDU0xsdGtsR1QxMDVQcllhNWhVVkFFVEZs?=
 =?utf-8?B?TGk3cU9lcVNYTUEzc0tTU2ZMeXdRaE9FL2lJYlc5bHBUcHJGdS9WUGQraHRi?=
 =?utf-8?B?eTBWMjV4YkduNjYwMUhxY2QvekQvZE5QOFVQazRBdHppQ3pUQWwrVC80Zyth?=
 =?utf-8?B?QkJKWUQwN1dBV0dTMXJwZm5FMXFISGZ2TUlkY05xNkVOKy9sZVhOc3Rta0J5?=
 =?utf-8?B?L1JDRC9IY3Q4U3QwV01DNWQzcFo1eCttdHdIc2tsaEJIWmdsSk9VUDlTQ0gw?=
 =?utf-8?B?a2hMK2YwVGhyL2o1RGNUMHV1dlh1R3gvenowQ3F6MTBjaDIrN1M3aVBiRXlu?=
 =?utf-8?B?K0hmT1QzUGtvcndXWG5hc1cyM3VHU1NsaWlEMWZnNnorcWNsWStsQjNlU1lT?=
 =?utf-8?B?OUN0bXA0anFXSGVhdW5GZ3JHQzNjRzhLbXU0ejNwUTg0VjlEN2RDSEk1b0Mx?=
 =?utf-8?B?a0g1SGRkWlA0c2pJRnJIZWd1L29jenc5SzlBVVpvdHFkdHg0d0kyN1ZyQVdQ?=
 =?utf-8?B?M3hvR2pEVVRUVFpsNXB3WUdjZVBSQmhXVVdDSXJoNFM3UmlQQXByL1pBYnJF?=
 =?utf-8?B?ZS9wVnFsNW4yZmtCVUFqaUVOZEwydVpVUFFaWkVwdzFHRnBkZ1BRSVF1ZmFC?=
 =?utf-8?B?bmxCTU51aTJ6NHRsSnpEWUtQZE96V2JnUFhVUCt0WHNsbncrcG5vL3BhSWU4?=
 =?utf-8?B?UjJUS2xnRHRoSktJam80ZC8rOU5uaURNem83VjdyZnJxbkpPYlVMVzFjellq?=
 =?utf-8?B?UnYzL0t4YUV0YVNUODFvVkR2YnFYMGNnQUQxNVNOMVpUUUlsQXZmcmZmU0Fq?=
 =?utf-8?B?WVgyNGRPVDJBMjVVL3pmL0gyM2VoOElsOWFCdlNDbXBPYXl1WGdodHJ0R1p5?=
 =?utf-8?B?SVdJWmI0eWRVVWZqUE5oWVEranMvdTFTNmF3M2dITTZBcDB0NjZxV0R1TW5q?=
 =?utf-8?B?ZzZiUkM0dTgzUFNSRHQyemtjTHppbElzcDdpa1ZWdlVFT1VsUDU2Wm5vaE9w?=
 =?utf-8?Q?46+bZ8i1oh3Qvzj8r/aerb5VjEyY44=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8afc9b9a-41df-4ed0-1ffe-08da0b534299
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 15:55:45.4806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 uny3mhdPJFzFNNkqqM++CuaJHFDnhpdWM6xFNbrBG/E5ibYDeGhjjjJiQIQRlKSil0clkWkTSI2hpZ/iloOGgW7LuDcm2mROJxXEelscJMIhL0qz/WAQR0rX/8sLhceD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4143
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 21 Mar 2022 15:55:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2653

Hi Richard,

On 3/18/22 16:42, Richard Purdie wrote:
> Allow conf.py to read the versions it needs from poky.yaml and have
> set_versions.py write this out. This means we don't have to change as
> many files when making new releases.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   documentation/conf.py         | 11 +++++++++--
>   documentation/poky.yaml.in    |  2 ++
>   documentation/set_versions.py | 20 ++++++++++++++++++++
>   3 files changed, 31 insertions(+), 2 deletions(-)
> 
> diff --git a/documentation/conf.py b/documentation/conf.py
> index 3015892d2..4bbe9b574 100644
> --- a/documentation/conf.py
> +++ b/documentation/conf.py
> @@ -16,8 +16,15 @@ import os
>   import sys
>   import datetime
>   
> -current_version = "dev"
> -bitbake_version = "" # Leave empty for development branch
> +# current_version = "dev"
> +# bitbake_version = "" # Leave empty for development branch
> +# Obtain versions from poky.yaml instead
> +with open("poky.yaml") as data:
> +    for line in data.readlines():
> +        if line.startswith("DOCCONF_VERSION"):
> +            current_version = line.split(":")[1].strip().replace('"', '')
> +        if line.startswith("BITBAKE_SERIES"):
> +            bitbake_version = line.split(":")[1].strip().replace('"', '')
>   

Please use yaml loading here.

>   # String used in sidebar
>   version = 'Version: ' + current_version
> diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
> index 89a059ef1..a346b7623 100644
> --- a/documentation/poky.yaml.in
> +++ b/documentation/poky.yaml.in
> @@ -5,6 +5,8 @@ DISTRO_NAME_NO_CAP_MINUS_ONE : "hardknott"
>   DISTRO_NAME_NO_CAP_LTS : "dunfell"
>   YOCTO_DOC_VERSION : "3.4.2"
>   DISTRO_REL_TAG : "yocto-3.4.2"
> +DOCCONF_VERSION : "dev"
> +BITBAKE_SERIES : ""
>   YOCTO_DL_URL : "https://urldefense.proofpoint.com/v2/url?u=https-3A__downloads.yoctoproject.org&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=5bOZnDEv39WIAA9f1qL5vv-kisLv98s5Xz7QWJFkX3FdBZ_HIDjlbL1LB-0BWVp5&s=j5LkQTKxO-b4aoleGDRBUWLKGNHceTefO7vyV_X0MTg&e= "
>   YOCTO_AB_URL : "https://urldefense.proofpoint.com/v2/url?u=https-3A__autobuilder.yoctoproject.org&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=5bOZnDEv39WIAA9f1qL5vv-kisLv98s5Xz7QWJFkX3FdBZ_HIDjlbL1LB-0BWVp5&s=bzAojsSaFdTWXYcTSVQ2Y2HNf4yAdaUPfAkLFgQvF2s&e= "
>   YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
> diff --git a/documentation/set_versions.py b/documentation/set_versions.py
> index 266ccf464..32259238e 100755
> --- a/documentation/set_versions.py
> +++ b/documentation/set_versions.py
> @@ -25,9 +25,20 @@ release_series["hardknott"] = "3.3"
>   release_series["gatesgarth"] = "3.2"
>   release_series["dunfell"] = "3.1"
>   
> +bitbake_mapping = {
> +    "langdale" : "2.2",

This needs to be commented out otherwise the indices are wrong since 
based on release_series index (c.f. i variable below).

I'm starting to think a dictionary would be a much better data structure 
for release name, version, lts status, and bitbake version than trying 
to maintain multiple lists or dicts and aaccessing them via the same index.

Cheers,
Quentin

