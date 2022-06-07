Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F199C433EF
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 09:02:50 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.82])
 by mx.groups.io with SMTP id smtpd.web09.10132.1654592567797540972
 for <docs@lists.yoctoproject.org>;
 Tue, 07 Jun 2022 02:02:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=BAwXPFKt;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.14.82,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M25jzNXMYDWitVT11HlXGz8Q6Xp70xhYR5/CLeUe99btD9Vtx4e2K07LYIRXp6ql4BclNpraWGU08HCXN5nNwksFzYYRVvlmKcu2GcgcADBwuLAMkzi5jcVQZrfGowqij6XmNccjsAEwHqIcquqWrNZvGqYvVlzSy+g172YI/FFdvztgYYWRn4HOOTi1jEn3H0fW5tlRdP5dLp8b8x+nl+86eBzAZoTXMcRn+jq6zWZjuCG6ztmR8sNXIYmUK5YzbnwgDkqHuLE+y+4saCYN37gSCAhMtv0mccHHUSe/FLUj2pje/qAY86AOiUHYdyU+tSByPcwNgh3G0lbfsnmZjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xLwenYVNzAZPcAqCqi8lPojMhP5W1bEr/z1MkgogcBA=;
 b=CRmfK0qf/O19PoRMoHNyJoccehjmE99YYHYO9FzhXt/ckngfS3cw6L4VSek9u41DmiJQl9HBUxLD/tdZWfREJN8hld5bmbJ2+O/STNrE5YsbOkw7aemz9Nw+0auyh5Y1nbFNUB1mMzAEgZ/KwnlXi4iQnTKy9ScfDUoZ9qtQn1UwgGMGnDudMPuGR3+3GHRyDKj+9eMNHt5w+RO1OkkmK55v48K1o/BypbQZU8gRo2Yjf55dvA7GY1E3XouuQI/xTc0QezO7ZLbaXZaMBGfXKoa8rpwmiDcISym2ycMvS56qiFohrc0gSs6iQ1MLxm1vm1yTqEdR5tLdE9Xj38TCZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xLwenYVNzAZPcAqCqi8lPojMhP5W1bEr/z1MkgogcBA=;
 b=BAwXPFKt+NzsMlhZlM9UxQc+4pEU6sJtl4300NCdTG/OL47RH0mTK9NKMjhE2Z57sNwu1SrH+mkCRw7bIaAMRN73onnfgapU6M+5wYddXXPtM4nlM86eeTKPptu7HyHpu/+XdG/+fpbpNvFZ/8p7PeuNBwLnGY9SzXAH4pQb3oY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by DBBPR04MB6300.eurprd04.prod.outlook.com (2603:10a6:10:c7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19; Tue, 7 Jun
 2022 09:02:42 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::880a:6606:6f57:dd0a]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::880a:6606:6f57:dd0a%6]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 09:02:42 +0000
Message-ID: <a67c00b5-20a9-fd64-66ed-fc0e040f2999@theobroma-systems.com>
Date: Tue, 7 Jun 2022 11:02:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] docs: releases: move hardknott and honister to outdated
 section
Content-Language: en-US
To: Quentin Schulz <foss+yocto@0leil.net>, docs@lists.yoctoproject.org,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Michael Halstead <mhalstead@linuxfoundation.org>
References: <20220603133353.506482-1-foss+yocto@0leil.net>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220603133353.506482-1-foss+yocto@0leil.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0013.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::26) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f4bfc14-2b11-4b2d-1744-08da48647af0
X-MS-TrafficTypeDiagnostic: DBBPR04MB6300:EE_
X-Microsoft-Antispam-PRVS: 
	<DBBPR04MB6300735A60F455D60397F08CC2A59@DBBPR04MB6300.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	L/6UBcLWnGfdl6DIjWaHOrP4Th2t2yQjIHKfnA7MlPAxn8ui/52jZIdCfoZlzAGWiVa5Lrq+cvCc2NpjZ3FYz/SeLW1ouKf2RMjFmaJHcco75SwRyu6i6D6UK8KvnmtwxfcZiICqIRjMqU5U/YHrqRHpNh7mQ4aib8DY4vO+lRH+42MvOzPMs5Z1ID5hGT+1UO4GqnnDRj+8NQ1KvLh0W3MpwPjhkF6KXaZU0Zcy7xF8N9zWEe2/kv40XFpFpoDrbtTtv4GYvLCExkxU6F593OHVZMmAP7qQ/02GK3zVqXG14VN1nRqPiqHXTNzc1wX7IRjV4DbB2F4FL/gV8Ae5iFRunOlQzfiYVJKS2ETyzTkcLvFCh78gSXblF0/MY42X2jiYQYPPHuxQnXNac362Dw3waCxfR+/2JTXVkNsifGmZcy9y2b9nMGexdoPpsSBuXXdqGHBxDNRVh05ZnwHBQTauQPFiu4/G6caB11V1QI1Uwhbtrv1NJku27FQxwc/ldYUiQVrzBH6/zEUAQJgmB5g9sFJ2dLXyHxnPKupkBT8c+e1qdJD40lFEroNswAPQkZlRJs8b6pY7dRYP9vLFYXOAabMNVgauo7PJ/358yztqRgGt16na2A0s9jqSLQdaf/oQ1w6MrQa5DuJNZgXuw56pwHKcsA0wIJjZ5vKulDCGB1Jfn1KesLQsAFJkb1u5o/8OQpLUSHJpk2XzvTQIxpCALCDtp8WQTyaJYra8InslmvVykmBLrxbusmHTHbzw
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(31696002)(66476007)(44832011)(5660300002)(38100700002)(6486002)(86362001)(36756003)(508600001)(8676002)(66556008)(8936002)(186003)(2616005)(66946007)(83380400001)(110136005)(31686004)(6512007)(316002)(26005)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q1FpdHFxcUh2Nk4wZzcvK0xpSnlpenN3NjUzWTFzcGZQOVBibUVCdnp0SGlk?=
 =?utf-8?B?Y0VIaGZTaHU4TWF6elRXN3Z2SXRhek5haG1NcFZYVzNib042dDdIc2liRG1z?=
 =?utf-8?B?YUp3cEJyMVdEbEt6c1pxVG9mYjdEd0dQK0ZGWUZJOVBpY0pLUmZOS2l0b0FU?=
 =?utf-8?B?and4amlvdzhmSDlwL2Y1a21ZMGw3S1RYRGxwdHFWaGw0Z1dsWmo3SThJb3p3?=
 =?utf-8?B?ekdjR2RwNy9jb1VTZ0RqbFljZm1oalNMNW13KzhrQVhvM3ZDSFhRSGFTUHJq?=
 =?utf-8?B?cy9TeXFveHNHOTdhZ3ZTNkV0ODA3V0lFRHlvdVIvZXEwRm5JVjMxdE1PQkx5?=
 =?utf-8?B?SGxPUm9PZWRNZTRvSEpacTh0UE9SWmY1VzJUZ2E5NVp3L0c5RHdmZElBL0d6?=
 =?utf-8?B?UExWaEZxNzUxeTZMNlR6bzhMcEVSNGdWZ0JjQUFkcjhRV2pxL3E5UUJFMkR0?=
 =?utf-8?B?SnBlUFpzVGc2ckttbm9tR0k3NTM5QUsxdTNmcHhoMTBiSC9PS080RjhZVDJn?=
 =?utf-8?B?VzRzOGJ3OC9nWW5yZ1RFblNHRnplRFQ3L3p6RzZUVVpIeXk5NjZLdFdXa3hi?=
 =?utf-8?B?bEtoZW42Nm4xSEx3QmZ2YjA2U0FncGdBcXE5aEs2ZDJpbVdBM0dqV05GRWtz?=
 =?utf-8?B?RTZTSnA2alptdXM1N2dKT3NUVUhZblhoRGZwMTVXQWhtdnE5ZGR1REY1Uk44?=
 =?utf-8?B?M1FoQUlETlo2ZUxGc2cwSXFlci9YMFhHVklWalZkUEZQd1NaazNDVXB6UkIz?=
 =?utf-8?B?OUJhT29DTFdsY1lrcTZjajMwbjlXeVJ3aEV5dU5IS3A5SXpaK3ZuQzNhM1pw?=
 =?utf-8?B?WG5QOGJPSy9EOUltTzA4dVRBdURnM3JzK3Vpd0RmSVhaZmJ5a1ppTi9QdDhP?=
 =?utf-8?B?ZS9XSnVVeXFTa3ExenRScVVzSEthTTVmODNtNHlMY1JXbE4vcFJzSjJ5dTlZ?=
 =?utf-8?B?NnBpeFVnbWxlWHM2N2FCSHlKYmVhK2JJU21pWHB1VmNITVhabndNVXpWRC92?=
 =?utf-8?B?Um02L1BPQmNZU2x5TkFsc2YyS1Fhd0lwU2d0aWJOWG1Na0JUK0kxbE1BR2FZ?=
 =?utf-8?B?MEh3cHA5TVRpN0FZZWVyK215TFhXNnJKT1ZxTHhGbVEwSVlWYjUzMDRta0RO?=
 =?utf-8?B?dURBZHB5QUNXNVVEcXBaQlVKa0hPYTJHc09PbXBLaUJaT3Q2eHJMNXFiMDRL?=
 =?utf-8?B?ZUJkbTBxY1ZFSllTejlpUFNxOGhMejVPYmdxY20rayt6UHNqVi90ZXV4Ulc3?=
 =?utf-8?B?Unloamw3QUZlRW5FUlJ5YVIzYkZmSGdFOWxiM0h4Wm41SHNpQm44TjRZeWNY?=
 =?utf-8?B?YjM2dHBFZnc2N2tFYU9CcTI3UjBXd1FSVC82SEFLeVpVeWJYSDFWQjJ4TVVG?=
 =?utf-8?B?WHcydksyYWtqRERldDJnKzVsNjVMV081bkpTYU8yZHY0bnhheU03M0V3SllV?=
 =?utf-8?B?K1Vad0F5c3Y1UlVxakFwOCtCUmsrWW0xZGpXYTNhU0JTVXBBZ05UUVcrbk1x?=
 =?utf-8?B?OUdIL1NFdC9EWVVlaFFzRnpOQURpVnM3dE51YXdvTHR0QXRSelFaVXlPV3pt?=
 =?utf-8?B?eGYvWCtua1V6UTBrS2lEaFR5YjhoSUkvU3ZnMVlEQVloa2l6M3k1K0k1SnN0?=
 =?utf-8?B?Z3ZROFZMbXFIOE1NbVlZVFZVM1ZBZE9aU3lVMnE2L095NzhQOXp0RFFVVGlU?=
 =?utf-8?B?Nld1b1RmVVRTOCs5V3FiQkZ0V3VGcEt6aFJVV1lrVmExT0RmMW1nclZKL2Rx?=
 =?utf-8?B?VkNTdGxNYWFtZ0tUSGFUdXNYTXhrK044QnRKdmlrdTZMMVNjYWlMUldPK1J4?=
 =?utf-8?B?ZnpnL2habEs4NjdqMlZOMytXaG8vL3BEWEJMMDZBQVpHVjJiTE1ML2tISHB1?=
 =?utf-8?B?c3RXYy96TkY2UGNBYjZaWmFKWTZIcElSVmJ6U3FPRW10ZFlrSVZwNjZnUXRj?=
 =?utf-8?B?N29wdEJxNHpTN2dndkZtYTNEOC9OM3BDK3o5MFkxcDBmQXZyeEg1T2VwNjZt?=
 =?utf-8?B?MzlyM0hTZGZrb0o0SzVFcDlraGNrYUhjY1ZtSHZRTG5DUHp0MWk5bmVPQ1NR?=
 =?utf-8?B?TnVJeUNNNEJPYytqTjBMdldqOGo4VkdoSFcwMi9SYm12Q2NBbkJteWY5RDZI?=
 =?utf-8?B?M1Z3RkU0MGRaS2tXNDVRcCtqcDRmcDZqODFkVHlYaTNhdkVBMVBHbmExZ2JO?=
 =?utf-8?B?Tm5kTVdDU2xIcFpLNmh5WXlldE9sc1k1b2tUamFNY005UytFR0lTMWdGVEoy?=
 =?utf-8?B?NmhIT1VnSDh4aDRlYWQ1TUt2c0RWb0gxeEVWem1WWUdUemwxYlI0Y081dndP?=
 =?utf-8?B?SWhDd1Z0RnhkVW5xaU51b3ZFazFiRWg3cEFGS2huYnM5TmZQTlM1Yktvb2I4?=
 =?utf-8?Q?guKWb3Q35q6xN3fYnS5zIqXsMHPPZryWJFAUK?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3f4bfc14-2b11-4b2d-1744-08da48647af0
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 09:02:42.6905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 NFgun+zAZKf09+dC1aP9pjDveXgZs7etjpXt87zwaGT/Vx1AoI4yKNm9LPuSCydgy7AHPXIW77w0boOuFY+wplk/yjVR24SZa99HB4FdLipaDMdoesa5xfdrPDCwCX3z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6300
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 07 Jun 2022 09:02:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2968

Richard, Michael(s),

I have been working on automating this release page so we don't have to 
maintain it (I stumbled upon it by chance).

The issue I'm having right now is that we are missing a handful of tags 
in yocto-docs which makes it non-straightforward to order the releases.

+# list missing tags in yocto-docs
+missing_tags = [
+        'yocto-0.9',
+        'yocto-1.0', 'yocto-1.0.1',
+        'yocto-1.1', 'yocto-1.1.1',
+        'yocto-1.2',
+        'yocto-1.4.4', 'yocto-1.4.5',
+        'yocto-1.5', 'yocto-1.5.2', 'yocto-1.5.3', 'yocto-1.5.4',
+        'yocto-1.6', 'yocto-1.6.1', 'yocto-1.6.2',
+        'yocto-1.7', 'yocto-1.7.1',
+        'yocto-1.9',
+        'yocto-2.5.3',
+        'yocto-3.1', 'yocto-3.1.1', 'yocto-3.1.2', 'yocto-3.1.3',
+        ]

Those seems to be the only missing tags (didn't check really carefully 
though, so might be missing one or two).

Is it possible to tag those (do we know which commit was used for each 
release?)? Or do I need to work on some ordering "algorithm" (there does 
not seem to exist a semver ordering in Python?)?

Cheers,
Quentin

