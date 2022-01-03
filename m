Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7E40C433FE
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 11:30:28 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.59])
 by mx.groups.io with SMTP id smtpd.web12.26577.1641209426479945921
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Jan 2022 03:30:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=e+f2PeAX;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.4.59,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XHINO6cR+53Kn6ekp4hI7YtZDCfu1lNjKVLH7UP40d5qt05hbizFU9acztMHBnFMu0KNehkRbQn0Q/qaBbhtHGZvuj9JdDOvYpfCiC9a9rupPis/uz7lXRo0vDeHKIYYScQaFOoXHCzZS7PieT2lDQ9nKDUM2JYB96FvlRs8CP+OBkGZ0KSObCHn7AbPwIMvM3zkbGImsO3XEC982QbL4ni9zwAGYlPhsJbK3fx8bzIwzKLzjtDfYZsE7I9qEPAsSjUWvNNoEjYvEuAGtInNVhoF6QPekECBKs+3EIEc2/7J25TBTR4fmkYgX86C9dRwBPyM320AainIQ/0s/gkdPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HFJrkaFuQHckTzaZ1CJuGTTO4V1BR7jYsOUtavuL/UM=;
 b=oKu34XqH1z0JePdrCZ+0hTZ0vY0bv8/nAWpCr8hBRC7Eko/OtqZNe4mlOWfkwT0ikOONED6DmN7r/kVpi8i4177Y9s6OB0zyrwwyHpGSNjJHZ7lgt4rGeJ0AmgbQ47xFYIz447LTXS9k9Fn1yniiiaJUkxA/mdog35ekqqxyZIh90HX3/HOcF9jIgXw8RL1nNrZIBRWyeeIM2Q/Ec2voHkkpMWPnTRiF7lBWBvcCfzFahpkziZsTjFF+31p0vAKNLS8CFbAaV2EftGbUWOr0RCNreKizJaM9WJFGCq4AI9VtAQHD0z+wtX1xcRDiESQAjWsP+bz4+/uAXcau5X4PqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HFJrkaFuQHckTzaZ1CJuGTTO4V1BR7jYsOUtavuL/UM=;
 b=e+f2PeAXzcMnWakKeSe3T1HjQ2/7IGdIy8HBxhJXdeGBo+QrnHefnRrY00jw5Nad8nfU7FDgh2U5hImZMRUiTwnUp4f/JE/WyIYvDcyNDWyDRR4rIsSNLrWCwPgKSbTLELR0RNIuQkQCEUkg3CwSnAhai/fkKI653sh5jKs5HJQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by PAXPR04MB9325.eurprd04.prod.outlook.com (2603:10a6:102:2b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Mon, 3 Jan
 2022 11:30:23 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::a8e8:87d3:e868:cc93]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::a8e8:87d3:e868:cc93%5]) with mapi id 15.20.4844.016; Mon, 3 Jan 2022
 11:30:23 +0000
Message-ID: <855214d5-f8b2-4716-a2be-8ec54909117d@theobroma-systems.com>
Date: Mon, 3 Jan 2022 12:30:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [docs] [PATCHv2] ref-manual: Add documentation of
 PACKAGE_DEBUG_FILE_SUFFIX
Content-Language: en-US
To: docs@lists.yoctoproject.org
References: <20211223195543.28919-1-pkj@axis.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20211223195543.28919-1-pkj@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0107.eurprd09.prod.outlook.com
 (2603:10a6:803:78::30) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3b986bd-eff7-4bba-e4b9-08d9ceac6e8d
X-MS-TrafficTypeDiagnostic: PAXPR04MB9325:EE_
X-Microsoft-Antispam-PRVS: 
	<PAXPR04MB932507E5C3F5B48EB9AA8EA3C2499@PAXPR04MB9325.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Peou4j1gY3Li3wT92B/nxmHCC1ba7uLJ197KVxZaujxlsA+5dvlYLCC7pQYw8t/DJyXKMQHomZ/U1PuyBlQoqINfKUdyXNQsJdQQFIb7vMgQCK8XT9ce39nPokqNWMr5PI1THwAoOFAmLZBTk3rsqKXWHQ6r/57xVyyTsR2MEyDBUcLipspOx3mYos72t7siEjAZCf3ck6/YWx0L0oJ8HaaMJJwIL31g7+Hcqrm6S7DkkJNEEJlyTSaJIFXHIyPwVNC+kU/ITa/mtmpOaQTdNuCvC85dedN5qJZ3fdSYtnnejHJIIqh6dDxE4GeDgRHc8aMYzjV0MtwO1++N7PJBXYJ03zLHNk5tsFm8pk//+XcKZ14AcbI7UZUI9Z/S9NKLEjkbmswvkwnpGr1/n93BZpWm5j1a8egFwhYHsclPV++6Zc99HyUU+BdbDBI9tV1L//IKfOafIWhlNCcAOKBVzD46uVDuB/kFtDwkbHzjJe8gECm7V4cNQnRFy+ERJdgvvNVRC2B7oig8eHqKKEfbtkrIsjAvDIMPF7jYzNcRJ6BQxskdPgoWhc6ktVRpsKHf09bHG3fIsd2wP4o0RmUCVKezdiyPUBaTrlwq7Px5iRtdiL4Yg+uWQFno+v4vOKKtMod2es8eahuBAJIpZ7c5s9EDjvPO8WVy6fb6HWp+29P0tGhyXiFeBHHKhBp6aY58622gfcb6OhWSHjF/43jmSIXdd9BIrXyHvVZW55msjvU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(2616005)(86362001)(2906002)(44832011)(316002)(31686004)(31696002)(186003)(38100700002)(36756003)(6506007)(53546011)(6486002)(5660300002)(6512007)(66946007)(8676002)(66476007)(6916009)(66556008)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S2pDdTlRWWpKVWNBUTgvc0FvMmFENmNSRkc5cEdwTVQ3azEzbmREd05SdFh1?=
 =?utf-8?B?UmRqSmtmNFMyVjNaVThxeU9KRkhaTkxiS0ZsMmhrQ1Q3d2VoRUtQZnJCOWRy?=
 =?utf-8?B?b1FucU9RNHg5cE05TVNINzRXdU9nTVZVUmhNNFZVWURjaXpxTmp1WjFGdlZw?=
 =?utf-8?B?Y29aOVRGMldzbTRSWHdGeE9QaSt2bUdZN0JvOFdLNXo0K0dtd0FkSXUvM3c3?=
 =?utf-8?B?bElqYnhDcjBpVEdpNnBSN3QwaFNEZGVNcnpyVnhna3M0NDI3ZzhSU0NscnFG?=
 =?utf-8?B?ZWU3dk9QN0NwY3NIcm0zeG9Ycyt1OXQrL3I1YzJkd3BxdnBQT25CV2p0bWEz?=
 =?utf-8?B?QlRSYktCS09KQW1Ibnd5NjdLUEM2d2d4WmhpQU9HVndNeVV2TkZTdlBiTURz?=
 =?utf-8?B?MmtWUWI2TU5adXU1RlBtNXpoRUhEMTBsT2NITG55dnJuNndBVnpmR0hxNDFh?=
 =?utf-8?B?MEYzb0tDY0cxRU1NZXF5UmFpajArak1namRMKy90VzJDZzF3eUg1MVFBNUJ5?=
 =?utf-8?B?TUxQRUFRNnpxNG80MHBhc0ltWlhrei9ZVEQvSS9IOHl4alZxQnBuY0V0ZFpM?=
 =?utf-8?B?cW9HMVRrei9idEdwTVh1WDNvTDdaSE1HaDJBbXkrY3BMb0Z1b3ozVEpod0w3?=
 =?utf-8?B?SFljU0JmSk1tTy9rd1YrOFNCd3MzcVM5LzA3ZW5HeW43eUZyV3ozNUZ4YXFa?=
 =?utf-8?B?T0s2ZnhLdXBFZFdYVHg1MDF1ZjkxYXVsRnQ1YUZIT0RUZGFiTWt1eEFyM0Ro?=
 =?utf-8?B?ejhSTVVPd2tkbXM5dkl2VzkvWS9jb0J3ckpQdW8wV0grZjZTQ3doRVZBR0Qw?=
 =?utf-8?B?SElNdi9DOUdIQ2tTQlhyNDkrZVllNUFZZWMzcnV2RW9UeEUxbTJrekxVclFl?=
 =?utf-8?B?ZGZySjQvc0o0L3NHeGdMY0p1eXJ0cC9QdGxTeEtobDlGUkRwc2dOZzJBbkJD?=
 =?utf-8?B?MnUxSEVjcHYzNEprU25xUDRrNjBOWXI0L2U4RS85bDgyeEtKWWZsOG1jSTQ0?=
 =?utf-8?B?NWwrMmhEaHNrVCsxcDdxZWZtS1QxUmJGOExTOS9CeWZWYmNZang1K3pUWWdG?=
 =?utf-8?B?MTdYVkZGbTdVUWZTay8yQncxVGRVS2g4RzNtRWNzVmg2czYvcXZuSzVqdDll?=
 =?utf-8?B?T3ZLeS9PQTlnTHloaTBnTHdQaHJSeU5SRko4MjdpWlQ5Z1M5aFE0WTl0VU56?=
 =?utf-8?B?Slh0cU5kRTlzQ28rZ1dIcmtPRlduVTFpR1pzaUZZT2hBOTRobU1hTkRoYzJq?=
 =?utf-8?B?U3UvbXFCR3hNcCtTTWR2RGo5c2trMmx0dFV2QzZTYmczdkFWUmpmQ2tPMFF5?=
 =?utf-8?B?ZlVOT2M3dHJwbTZxMUtaV3p6cWtOdk1CQWhBcWxJRHprZURNbktRdjEycnVC?=
 =?utf-8?B?VWlaelAxaDhEN1kxTFBHWWIvekF1YTZXdWJrT0wxNnFMZ0FibWRmdDVic1Jj?=
 =?utf-8?B?ZUlxZlB5M1F5YUNybS9rUW1wVVBlaVFwZmpPQndWNFNNV3dzZ2tKQUUyQ09i?=
 =?utf-8?B?ZTZ6MXJncEpjeUFzaElzOW1MOFVXQ0RSMC9YWDB4K085T3BSZmdsTkN2U01X?=
 =?utf-8?B?SmRzYnI2ZEdsUnk0YXBGMHJEVFZrQmVuVFo4WEkrMFZoSU14S2J0ZkZTUTBE?=
 =?utf-8?B?NFVHalMxWk5pRVdMNGNQMWI4YnRkTEpwNFVqb0JMOE85VVJ1cmhTUmNZV1Fo?=
 =?utf-8?B?ZURGM3p2aTBCaHZ6SFRFVW45blN2ME1zaFo1ZWV6MFpFM0pRalBZdnFHTFRL?=
 =?utf-8?B?cThValVPNC93SEprQkRhelhnaUlnTUdQMTNuNDBwU2w5and0b3haQnBJcDlM?=
 =?utf-8?B?NVlGMmxSMy9hUGtnU3lqZUtQSHJuMjhiRWJINHhTaHQza25xV1pDMmVtRVdq?=
 =?utf-8?B?Q3J5bSswbFRtaHNZczhnWFZXQXpFaExITzdpZ1dhNWx1c0Fub3JQaFFUOFFH?=
 =?utf-8?B?U0EzdE1VRzI4SnFyYU5SMFJkZVhyL0NCaFNtdzVqSjM2bU5lcmVCa3VxUHBQ?=
 =?utf-8?B?MmVPME1XSTcyVWw0NHlXSjRDQjNYT1JFSjlFV2JUeWlvd2luMlZ1WU1XQ2Vt?=
 =?utf-8?B?Zmx1bWVvNGtxQXhVTCtJVjlPMU00dThGd2syQ0hwdGVrd256LzZlZFFxZ0ZC?=
 =?utf-8?B?WEpuNDdEakRxQ0RLRjBpT283b2dTcUJwUFFxamRjSTB0RDkrd2pxVDQ1NXJ0?=
 =?utf-8?B?Q2Y0ODdITVF5VlBiU1ZreWUvckxWK1dFaUp3eWJWS1RHTmtGQjMrYkJ1elUy?=
 =?utf-8?B?cXpTLzR4ekdHVTYxc2JYeE83Qkw0ektSMDZtMGZqNkZFcyttV0dUTGZ2SzVl?=
 =?utf-8?B?OHZGWitkajFxZzdLdHJkMUR6THFYT2h3ci90NDZHUXdlT1Zlb1UyRU16ci80?=
 =?utf-8?Q?7yufqnGQ89BaDxnI=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e3b986bd-eff7-4bba-e4b9-08d9ceac6e8d
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2022 11:30:23.5062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 O3ntsF/tlDWzhcT68R8Qq2hjLFuT26tyWxCC3hqjNw5j3ck/SLqnXk09h77lUonulZKg4Mo4/Jy0KmCWuumGNy5MhqCDHtdWA4b1GBPg+QBLSSFAg0+1x4H+6FQkhd5B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9325
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Jan 2022 11:30:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2329

Hi Peter,

On 12/23/21 20:55, Peter Kjellerstedt wrote:
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
> 
> PATCHv2: Removed the reference to split_and_strip_files().
> 
>   documentation/ref-manual/variables.rst | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index e5216b3f36..c7c9e31f05 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -5085,6 +5085,14 @@ system and gives an overview of their function and contents.
>         result of the package manager in use, see the
>         ":ref:`package.bbclass <ref-classes-package>`" section.
>   
> +   :term:`PACKAGE_DEBUG_FILE_SUFFIX`
> +      This suffix is added to the names of all files with debug symbols that go
> +      into the dbg package. It can be used to make the debug files produced by

s/dbg/``-dbg``/ ?

> +      one recipe unique to avoid them conflicting with identically named debug
> +      files produced by another recipe. This may be needed since while the
> +      target files may be split in multiple packages, the debug files for one
> +      recipe are all in one package.
> +

I'm not sure the explanation is correct. The fact that debug files are 
all in a package is not the cause for conflicts between recipes. Were 
the debug files split into different debug packages, the issue would 
remain when trying to install the debug packages of two recipes with 
conflicting file names. What am I missing?

Also, if it's really a package issue, maybe one could just use 
NOAUTOPACKAGEDEBUG variable and split the files into different debug 
packages so that the conflict does not happen?

Cheers,
Quentin

