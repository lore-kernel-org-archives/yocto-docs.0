Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E339C88E72
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 17:07:28 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.38])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2837.1789405638590425218
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Sep 2026 10:07:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=lloe3qj4;
 spf=pass (domain: cherry.de, ip: 52.101.84.38, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rHaGu+a5ANb1GW8uQM7YNITPdVQ0jMFZ2gOmSafV6v3BLxeESh3ekCAjxctsn5lAzsaGGfVvojh8BuQ4086UrrXdqCbC1scOm4We2gykhAPAARrrdamHpBXOrRaNGA3vi58ZKMknUTFdDFw2suWlKCI5+u6xNi/hzM+8dTKlN52J7Ic6fF1YaPQaJAn/UOqCozTWsexNvqzL/+olzflsYCpvF6bT44NyL5LRnhGiZbZFLtgPVmd5QyPm05H4dT8Gn6i6Tq9PUdRQChjSBsWsulkZJr5430NAnF3ghHPKpBHrqBVpS8ONRsZrB3oYiA6K2IKT8ZKdNtsBIaPgmIpliA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3POuBVeddmSdrxCdJUD7KrEfgkC4XaaW9wV+OOWifs=;
 b=YJ+kdZLzbbK8Szd635Mj/GKlJM8EQK5Jmt+xG9cO+zNJUaLCePqjaaqbcExdDE38bIYQIc6sK91kN3Wh2W0KpSi79HaorfQYsyz5Z+rn0+3NicQWAYFrquT9xz4RXkDJH+4zmUfAMLQkdv7sY4CAI1LGeBhgSInYbbgx2HwSrHe+zegNUueguPA0NO2WioFXacPsbW3k4V+oHqri6sBGYi0iwhv4qIoViB1l3UUA56mhZ96Gvze1/ilVD1VlBFcfWX2vXyl+BHJpRXMSM/9r71JI9D/W8MS3IzoKkYqmJPGK6rIFfUMi4C4n7QgCo+PI4NmyU2TAgelMFl20J7GaRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3POuBVeddmSdrxCdJUD7KrEfgkC4XaaW9wV+OOWifs=;
 b=lloe3qj4vqbvZhVi2/62QKpR2UM6H2CwAA1iwKtLTjdv80qIroXxS5/m0Ni+w7M91JLRZ2fKFQ8K+jMxXw7oS8PP+Kb9MmEwfGYQP5TDh45Gwizosd3kcSeIThyN54yy3LtxM5rCh5fIuA57WVnQ7eVDqJWu2ac20XDNRAtBw2I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by AMBPR04MB759424.eurprd04.prod.outlook.com (2603:10a6:20b:799::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 17:07:13 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%4]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 17:07:13 +0000
Message-ID: <79063836-a355-475b-9e40-7b2ca80d70c0@cherry.de>
Date: Mon, 14 Sep 2026 19:07:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] Makefile: remove unused O variable
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <20260821-remove-o-makefile-v1-1-fe61b5cf7fe1@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260821-remove-o-makefile-v1-1-fe61b5cf7fe1@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIVP296CA0007.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:357::13) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|AMBPR04MB759424:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a64e7d7-3d15-4cf6-d5d4-08df12829f48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	T2Uy9/0vdquTpELeZq7ozgcZFMdWR+maxfrI4rDVz3Jf+x6KYxPgFvAmV5tpiG8QkYnydfOPBMF+FED/WmIMYkWMeob/cHMQYvPcRLfkO6QmH/DVrrcGFdAfqfEnhl0UfahuQVdHNIPOMY4BUzNkYIC1uOnxFcUHy6E2zdK8tOvSLdWgBoJRm26PxiizInui5zLLau7x5L+Xm7lfso2rdpHjVLIXicpYjhVIXl/sOuCvemutJfyFfzmiQHvrAIt+VJJIpht5SKyDvl+Go0s1p/tZAQg+oHLtOa6jg6RpNOz67kY5KeX045BtbsZXqYcO8QJXkfeRhL2kpvr2lH8ETl6IohEdC/EWP4AaEUiWHt08ahXpFpOcqrBKd3frgHhltZ0yTlK/VwVo1rWFORdxeG06uCT24NGalguvzLvSId+kp4JjqoKbcGzBAFIRqnwtteufH+R6P0bXdckNt4XIc306RR0KvDK3QqpH5FVWmxfEL7bcH7WZZ1kt2HcXZViOMn+q8O8TNxl0E7ItDISC09pMAVI013Wq4gVQ1QMxP2UvYGdrRoFLYBUhe7oe50RVg58TFgAu7sHD7LbrnqHfYcc0rxHmdQI5Ca05yH8tCS0h2vTWPE7k5vRFsDBgqmIZe891yQKnFP5yf52b0mlQEDFfA00IzZxAl04I5/CaSEw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aVo5Vzl5ZUNMRGpYRk1HU1ovQzlKU1ZLOFNwZ1VOVGtRSHZHZXNFRmg1Q213?=
 =?utf-8?B?Q2VvUUpSVTV0eUtvdXdtS3BlOXJLOGZRWjhqMW13VzU4TmtnbXV3MU9XTmFo?=
 =?utf-8?B?ZStwS1RtNmV0TlNVZEUxNUVpY0MwVk12c0plVVY5Qjd4UUxabXRIQUtUYzh0?=
 =?utf-8?B?MFhEY3ZnUytLbkZhODZzSjd1UkpXL28xd3FIc2ZPQlJmZkt6MW9BbW9acFdM?=
 =?utf-8?B?M3pENUExUE9HdDlidDRRMUVHcjdZT3pzdHZUV2J4WEY4eEFrSi80eFZzK0xP?=
 =?utf-8?B?dTUwUTFYNTJKcS9nMFFxVmZ2MllwODR2VnNFZ3MvSlF2UGxid2d0ajg4SUU0?=
 =?utf-8?B?ZTBwclNPdXd5L0U4Q05JUnl0WEZrSGJsc04zQXFJcnlGMzEwdi9KRTkxSVgy?=
 =?utf-8?B?OHQvZXUzK3grMWZJNHBqUUpZd0xxdHArQkIrNmJhY1QwS3EybXBxQlJPOW9L?=
 =?utf-8?B?RlFXemI5MzZNL3pxdDUyN0hpaDdUd3ErSGI5NUZ6em5nWXJLNVhnRk9GL2Zj?=
 =?utf-8?B?MVk4SU5UUWlQNUZJV2FOWHczTHp2dk5LSEUxU1lIcVdCclU3MVBkK0s4ZTcx?=
 =?utf-8?B?NmlpQmc1SkZ0KzJKZDdYaWFtQWlSRE1DcDQ0RVhTZ04rSE0zR0hMSXlWR2xF?=
 =?utf-8?B?V2Rob2dISUJ2UGQydXN4TUREUnBXVUowcnVxRzRhdmZTWTlBWVJIQ3FNY0tW?=
 =?utf-8?B?SW9ld3BxN3ExR1hGWTh6NWpPYVRWUTBKRGYwYks1VjY0Sk9xUEhKNjdockt6?=
 =?utf-8?B?c24vY2QwU0pON25OS21QRDRVQ09SdlVxWW1HVVJSN1lnZHNFanU1cWdlR2po?=
 =?utf-8?B?dThHd1JNdFdBR25OWU95WVVXMHR4NzBmOXpLN3JWaU1Xam9MZWlPOUJLLzFi?=
 =?utf-8?B?bG5oRHlIVGx1UUhRLzlsc3VtOVJ5NE1FVlIrY1VxWkE2VzNTTlkrWWFIZWpo?=
 =?utf-8?B?aEpNUUZOaTBlZGUwaWJNQlhmNVR0OHg1UkxKZGdmZzhCbDVLQXI2QWs2cEVT?=
 =?utf-8?B?MXVIRVdHQ0hZNGZVUWJoOU1hSXQrWkdRU04zc2REYWd6N3FCRlZJN2VzZFox?=
 =?utf-8?B?Y2pRa0gyamJoQ1kvYUxPNFVTVHdyWjI4QXVLRW95Smh5NFFTWkxuUlNnSFdF?=
 =?utf-8?B?dzFkQzRHcHpORGZxemJqaXBFVTFxYW9YbHp3WENkdmo0L3BDdDFNR3dBVDUz?=
 =?utf-8?B?WUVmQUdXZDZMQjdHRnlGU3p0bEErYkN1VEhKMW0zem5aRkVnWEd2THZaSXFi?=
 =?utf-8?B?VnB2bUN4K2hianhCT04xVkVleFMvdkQxMkZ4UmRURFdnNW1LSHhwVVQreDJn?=
 =?utf-8?B?dnVvQlJXUFNFVWZQSG96TFZuaGl5WXcwblpuUUw1bzRESG9KMnFRem5YUURp?=
 =?utf-8?B?aGhXVWZLSDRpSUtRYlh3SE9nZitkQjFERzNzMFR1TFpjSE5ySlZGelBVQ2sy?=
 =?utf-8?B?WndvN3pNTlVXWHl4MXNYTFh2YXZhRFhRRmRydkRoN3FTRnBuRHVkWHNHOTQv?=
 =?utf-8?B?K1YzOVZpdERGOEFEcDk5c2wvNGo4S240dDQ0czJCVjB1UzJPd3hWRWd2Q2p5?=
 =?utf-8?B?ZUxqUTJ4OWtzSXdwaC8wNldMUG9YdEk4ZGlWRjFkWjY4ZzVTTitzWUtTTm1v?=
 =?utf-8?B?SlFCb3FOTG1YSGJwQnZ6VllYTkRURWlzY2VYcHhlMk9QYUsrazg5RFA2eGF1?=
 =?utf-8?B?aVpXQWc1Z1ZEMVQrNVFFR1BGRldOWm1hcThuNnF0U3M3S29JWmN0RDZNdVUv?=
 =?utf-8?B?ZDFkZDlWN253RjNadGR0Nlc0NFkrNkNIbU1kREVDVnAvYWtoWmgxenRaSmpW?=
 =?utf-8?B?UUVmWjBqWi9CY0ttWnhqcXJFMnFtalU4cktzTlB0c0JXMzczVDB0L0FESWZt?=
 =?utf-8?B?Y0xDY2VyQUdGTC84V0RDTnFlUUY0d0VudTdPUHFnLzVRUkhFZFBYWUNmL1hr?=
 =?utf-8?B?OXBmZ1VHUWRITldoWlBZbXd6TlJpblZGTkpWM1U2Skk0MjNGZjZuN25oenE1?=
 =?utf-8?B?bS9KMUNuQi9WQk4vcytXcWlncEdQd3o2UmtHT0JQdnJEL2RLWTV3ay9ncGxu?=
 =?utf-8?B?NzNZU09uZE9rWG5GYlJiaXN1TDlrWGp5REhxM25Cd1k2UklZQmloNmNRZmFt?=
 =?utf-8?B?QVlUSU55T01xSGlKWG41aHNqdXBMYlZPcmNyaUVWZVd1Y1dsdVYzMUlLTC94?=
 =?utf-8?B?NkhBZGFjQm1sL1F5UEtNRGcyMzBIemtwdlZiL3hmc0Ric1JRRnB1T2Q2T00y?=
 =?utf-8?B?TGJZMDVuWEc1eHlFRDFmNm5Ed0xWd0wrYitRSXBPcXVYWVhnNGRScDh1dmJ6?=
 =?utf-8?B?WkxXcmtCY0FyQlJLc29RUkhRdHQvaURtQXQvb2xUNDNuVHNiRnpCZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a64e7d7-3d15-4cf6-d5d4-08df12829f48
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 17:07:13.8762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T+7Bt92a38hQy/dnTw9uxxopYSNKllPtJSjdNDRgYsssPcj07OSHz8Ig09IMaIqc0K7eZlKHI2uS5mkKuo7c2K2fSyjoRdd/D7u0BPpDH94=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB759424
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 14 Sep 2026 17:07:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10501

Hi Antonin,

On 8/21/26 2:46 PM, Antonin Godard via lists.yoctoproject.org wrote:
> This variable isn't set or used anywhere, remove it and remove the
> misleading comment.
> 
> Reported-by: "Robert P. J. Day" <rpjday@crashcourse.ca>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/Makefile | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/documentation/Makefile b/documentation/Makefile
> index 87a6f8a8b..2df23ebf4 100644
> --- a/documentation/Makefile
> +++ b/documentation/Makefile
> @@ -19,7 +19,7 @@ endif
>   
>   # Put it first so that "make" without argument is like "make help".
>   help:
> -	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
> +	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS)
>   
>   .PHONY: all checks help Makefile clean stylecheck publish latexpdf
>   
> @@ -51,12 +51,10 @@ sphinx-lint:
>   #   Unable to read an entire line---bufsize=200000. Please increase buf_size in texmf.cnf.
>   latexpdf:
>   	$(SOURCEDIR)/set_versions.py
> -	buf_size=10000000 LATEXMKOPTS="-silent" $(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
> +	buf_size=10000000 LATEXMKOPTS="-silent" $(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS)
>   
>   all: html epub latexpdf
>   
> -# Catch-all target: route all unknown targets to Sphinx using the new
> -# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).

This was actually a useful comment (aside from the last sentence). It is 
a catch-all command we redirect to pass to sphinx-build as the builder. 
That's how we can run make html, singlehtml and epub without having 
those make targets defined!

Cheers,
Quentin

