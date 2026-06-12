Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14E14CD8CA8
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 12:04:50 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.14])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68912.1781265885116347774
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Jun 2026 05:04:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=CHumXIIj;
 spf=pass (domain: cherry.de, ip: 40.107.130.14, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eS76cjSSlAOMnL62ET+5EZIXZ4m/dKsuTlkXtn1ZtXLes5YQbLJqyWn3Dv0t7aVWg4sjpyHGm46SRLGM0CKxmuSKtxsYA3Bfyu9eHfopTU6OoPqq4fVQtXOQY2V4EAkN9gHPy5scfgX5zntmKF5bd7vEAPshuNoOvYzzCh4wms6vXitKPvvCltg2NaZZSmbUpgm4msjQx/o3O1jfzmZ0JGIj3oMEdcJDtdLdTsS3vcRJ3W04Y2RsYptwkn9KvzzOuAqsh6Ow/gjmpiKY8Ify4zkOnUyyHt1mJRH5mJINNQkEmDzMzXSAjfguji6qfxfkki5ioGyeS6ffCFqYb6abiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/tA7yL/ZqCtHJMEuR45JNxEfppB970UVHAILs+asJ/o=;
 b=IZiryLfRWY3dsI6NteP1CjR6D1wqP4G7G5RHVAfBe7dTTSrjBtXRhVplgqgrCOnfoWjL1jLx2usrwLWwWM7nPkAuGK04ZVm0HnaXE/MJLWFvC/j1CvFEzA3SV4ZClyTbjXcSIcEmrW8BJn6xzT3gevCmQl7vTjqpVmeLSR6UZScr9u1SV4yjxfRzGAbeqw4ygi4ar9HKVW+1vw6CksXO3Wc2US/MMprqgUadjHgOHdbutoeVvCy8VMFLPSrMG9NA8+uhPZVUgJnrMtn5PhR/j2wd+O4xYCqw/IHLyOq2SNeewXz5X8vCKIi5LtshETcL0F8iGemOKy7d2PVZplnkGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/tA7yL/ZqCtHJMEuR45JNxEfppB970UVHAILs+asJ/o=;
 b=CHumXIIj8Z2DtRn15kWMO6x6/wCZcPh0/i/MjyiDU8brpu5VRwcLniAjgJALrfsYc9CJYNng9tlOWNIRrqYGcPUpFnQVzxWz9bHIacUetaMYk29bMwe0zTIVaW2SaGWpD+nBCB6jJo2udydZXAFy//1azaIiZ01v0W9xq4pmQRs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by AS8PR04MB7605.eurprd04.prod.outlook.com (2603:10a6:20b:292::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 12:04:40 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0071.010; Fri, 12 Jun 2026
 12:04:40 +0000
Message-ID: <1fb59ff1-599c-49d8-937f-f35fa4b74110@cherry.de>
Date: Fri, 12 Jun 2026 14:04:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] dev-manual: correct which package variables
 support which backends
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
References: <063e2bf1-5f48-3ea6-f18a-3d422af03a2f@crashcourse.ca>
 <2a441c4a-81c4-4c51-a80f-7dec845cba45@cherry.de>
 <8cd4b7b0-6d05-1291-155f-4223dddc8176@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <8cd4b7b0-6d05-1291-155f-4223dddc8176@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR3P281CA0028.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::19) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|AS8PR04MB7605:EE_
X-MS-Office365-Filtering-Correlation-Id: c0b11bf2-14be-42be-f066-08dec87ac838
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|4133799003|3023799007|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	gXmSU+09SILL2WntSXrgcbwc+4agX5GHjsFMBKtdtfFB1/Ta776hc91L0JMpFLHcXbkC85kTC4JhiIjZMzV4w20VJJUgZtde7WOkefVpb8R9OOkFGO9KiCiFHNwihnibw2zgeG76n+WR1GLJ+iM3+flPobNAm2VxDIRSaX8ioDsHPhctx8WAyPXnAjSm8fWEA2ODzkQignXVTcwHxXI7JwA+RyZWNrcvM12gP79Iz9P2x1zU+6REAO65MZgync8ax+xDgCZ1OP9ZZ8TDBYfq8adbHO1YZzWpeIpmA1x+zseLjzU8VSnGKfgcNXFHVD5UZiYXNMrOcqo/kL7ZVv6z9b9wcyrGaj/NEwyNX0p/i5yTdvRVKjM5fB943uWpbKC1ysrI0sPJLv2K0YRlbZIg9JRWBLtpLRw0zAzGn3djxTfH267hLu8pF9OJuyvbK4gqjINzOKz0wOedikkgg6ln8ByBspu2wAyz7NKw+eXk0QJDuWQPFccETPGKqnDVTdPgb4MT//Vu5WCiYZRzVy3touXLbBsSCZUVBe2k32pDH5ScXj7v96IzVgjxxMIxDyYItlR+rYyKbM971AbUfUo17Tap6BBGtTj/6SgmJ1GLQQgx52cgcJNmF967wbSk7U5Bn1Cun2hVt7/XBC0lq1iL+Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(4133799003)(3023799007)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SjdLbWxta2dMYlc4ZGdxNUNSSzlUU1pRMmsxSERUaFlBTmVmU3E2cDJqdkF0?=
 =?utf-8?B?eFhxT0UrSGJjem9Ea0srSXM2VnhVdzIvdDJzeWUyS0tjdkhidlFGTnp6djZa?=
 =?utf-8?B?SHVlZ0xteHZHVzdlb2wvZVdoSStZRmk1RkNwa0p6Wkw0Vy9PTG1XQmlMRTIy?=
 =?utf-8?B?cC9oekpUOTltOGR4R2tJdjdCcm1pa0ZibGgvbFZLMTVDdVVLNXAxUVQyNzU4?=
 =?utf-8?B?SGNhcTRiWFJHNFBXczRsanNERUhMYXdMMEQvTWZMTWNhdFJSWVM1Uy9Ud0NW?=
 =?utf-8?B?OFpBMFphL05zcnlwTDFRSklCdVpUOGNRYnhLTjZWL2N5dWF1YjR2U0hnUXhh?=
 =?utf-8?B?WkxlZk15YzRqR0RyV2toWUdwUWpYdHdCZXExUmd2bjcvd3hsbTRZQTgzQWdz?=
 =?utf-8?B?R3pSVTI3SnJZUTE1OC9yZXBGTlJ6eXp5aUhtVVNRZlZ3ZCtkWlloOFN2aDRF?=
 =?utf-8?B?YWhWQXgvMUNGSUNJcVZORk02b2hlVjFybi85NmwrQ2M0VktrcXd5bU94M203?=
 =?utf-8?B?MjBqNnJKY2NPL1FuSTNwUDkwMm0xbi9lQ1Mxdng1UW1QSnpwZ21QWEVzMTJ3?=
 =?utf-8?B?RjFPNFQ0QlNIeUJGaHBzcFFiaXBaRThIMmRTWmd6SWVWS2hBOHhJWWFQcER3?=
 =?utf-8?B?a0lwcFlRbHdaL1g4ZFFPNTFHVXBNZ0dmUUFxMW0wWHc3MlZMd0UrOWhJMjRy?=
 =?utf-8?B?OFc5cW4weEtiM0I3WW5EOS9mREZLNDNyNTVuNCtLTmRoK0l5blRxVC9JMDdN?=
 =?utf-8?B?WDJOb3lMUjdDK0d3YU9BbnM4MTIrcm9CS3pWcmU1TVY1bFBzVVBiZ2s5T2t6?=
 =?utf-8?B?YmpIUG13ZzdYTDJjWTFSYkVUbXd1c3F4V2lHU1lWajh0M0VabUhZUGR5bzFk?=
 =?utf-8?B?azBBRS84cHcwbzIydFQxTEtQR011eUJ1akRDZnhOcm01WkZBVGhnY1dWWGVD?=
 =?utf-8?B?cVBnbzVGZFJldmJNeG1STTVPeFNqa2xJNEU4ell5N212SWRJTTRGbmdHNjVu?=
 =?utf-8?B?TEp2Z2FmcXRGRytkV2QrTnlzdzhhOFloVmxEQlBFM3kxbzRaUExmanQxSFpR?=
 =?utf-8?B?QVdCQ2NENjBOSmF6SnNqNUJuUUNROXpmL01PMjVCSGJ4TEFKWWNMZFVXZGRW?=
 =?utf-8?B?dkRDN2xtQTlBeFl5UXZwYTIxc1pLVm5CZHU0bjQrdU83MnFCeWVkZnM3azVD?=
 =?utf-8?B?cDBxZmFLZjQrM1laa3R0MzR5RW96a0s4REZDSzluTGtob3o3UlpHaWNGYlds?=
 =?utf-8?B?REF5OW9LSVIyTndCZ240MEw1emY2clFFNEZka2pYM0w2MG9KdDdKaU5SanJG?=
 =?utf-8?B?SUVuZS9vUm94QkVWd0RtcFU1TUk5Y0JSVHdCNTJacFE0NXJZVENsVkpJeWYy?=
 =?utf-8?B?WVdQbEVHbkdNTk9HWVVHZnpxOGFsNlUyaTZuVHZuTklJZTNRRkU0Z1RqSmFU?=
 =?utf-8?B?bDc3RDB0ZzVpVW9rMDNBVEs1SW9DbnZlTVJndzdkaStWKzliNUsyVDVrbUpO?=
 =?utf-8?B?YU51Y3cxM3FuZURHVGVXSDNuQUttTHRLZnB3NmRZbm9rb1IwRldNQkgzTnBr?=
 =?utf-8?B?ZElmUndpSFUwWUxZRkNDeXpzLzlVcVZkUGYzdHk2ZVllRUZWd2c1ZVdKWUla?=
 =?utf-8?B?VXpnbEtsSk1lb1BvMWc3eEFUWWxIY28vSnRWeHZpVFNyVzFoNmJhSFlzYnRu?=
 =?utf-8?B?bHgyUUFvR0VZakNyQVV4eGYvamtQK2xuSlR6RmMvcFlKeFR3SGljcjRNUXdE?=
 =?utf-8?B?d0RvM3QrNmpUSGo4dENWVmtiOVdLOHhyaHY0cVcxRDFyazN2Nk1JaExyNEtR?=
 =?utf-8?B?S25hdk5sSEhjcnVuVGlHVytEYXNpTmFHZ1lOSEhpTUZySWRvYlQzcFRCU2NQ?=
 =?utf-8?B?U3hPdUZxUURNbFpha1JMM0xndkZkcXlTZlh1OFRYejdlWGhld1hKNFdpWWNu?=
 =?utf-8?B?V1pGQXJvNDhVQ0FybXo5Ui80ODNMeUNpM1NFOVQvNVNYWjRVc2ZYZ1N4d1Vt?=
 =?utf-8?B?N0dOOFRFWURxRjBXTjA1TGdyYWk4ZXZYbzIxQTZobWxIejEzQ0VtMXpmckVJ?=
 =?utf-8?B?cmxyUlRHdjVEa1JDVzlYYnBOcWJodzRPZmFONXJWYlQ5K2g3SXdCcmptdHpC?=
 =?utf-8?B?dmtxQWhIcGIyWXhvZUE1ZGRWVnBRVGcxd1o3SmZmUXlYY21jcnBOK3J4YWMx?=
 =?utf-8?B?R1dmdklsa2FiRlBlUHNlajV5SE5Qak5VdkJEc1AvZkw2ZXd4WEo0RHJTdWF2?=
 =?utf-8?B?RjlPS1VCeXRkYzZNQ3hWVVltOHQ1MXgzRXVscVVBTVNHdGRKMHdOcVd3OGNw?=
 =?utf-8?B?bXVtMXVsU3RlVnVtZDN6bC9TOFAxNmNtZDdZWGRwd1lXQkwvVUp1dz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c0b11bf2-14be-42be-f066-08dec87ac838
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 12:04:40.5130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6qcfLIUizAG7SOzJJojpPm0ggpP5HIjv+kT2QIQ2s0m2ssTzxVuj1sqJXeIx93iancGjJM6oMHxVZLYu1LA8sWDEMJrJujeGlEdjhn5gqJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7605
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Jun 2026 12:04:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9708

Hi Robert,

On 6/12/26 1:57 PM, Robert P. J. Day wrote:
> On Fri, 12 Jun 2026, Quentin Schulz wrote:
> 
>> Hi Robert,
>>
>> On 6/12/26 1:33 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
>>>
>>> -The following list introduces variables you can use to prevent packages
>>> -from being installed into your image. Each of these variables only works
>>> -with IPK and RPM package types, not for Debian packages.
>>> -Also, you can use these variables from your ``local.conf`` file
>>> -or attach them to a specific image recipe by using a recipe name
>>> -override. For more detail on the variables, see the descriptions in the
>>> -Yocto Project Reference Manual's glossary chapter.
>>> +There are three variables you can use to avoid installing particular
>>> +packages into the final image -- you can either set these variables
>>> +appropriately in your ``local.conf`` file, or attach them to a specific
>>> +image recipe by using a recipe name override.
>>>
>>
>> What do you mean by "recipe name override"?
> 
>    that phrasing was in the original explanation -- one can set, say,

Not verbatim, and it matters here.

> PACKAGE_EXCLUDE either globally in local.conf:
> 
>    PACKAGE_EXCLUDE = "minicom"
> 
> or attach the exclusion to a specific image by using what the variable

^^^^ here it says "to a specific image" and this patch here says "to a 
specific image recipe".

If you have a recipe name override in an image recipe, it either doesn't 
work or is useless:

my-image.bb:

BAD_RECOMMENDATIONS:pn-my-image = "test"

is unnecessary complexity for what is simply achieved the same with 
BAD_RECOMMENDATIONS = "test".

The phrasing could hint at:

my-image.bb:

BAD_RECOMMENDATIONS:pn-some-package-recipe = "test"

But this doesn't work, because a recipe (including an image recipe) 
variable scope is specific to the recipe and cannot impact another 
recipe, thus this is a no-op.

> glossary describes as a "recipe name override":
> 
> https://docs.yoctoproject.org/ref-manual/variables.html#term-PACKAGE_EXCLUDE
> 
>    PACKAGE_EXCLUDE:pn-<target image> = "minicom"
> 
> so the phrase "recipe name override" comes from the glossary ...
> should it be called something else?
> 

That's ok, it's just combined with the earlier part of the sentence 
which is confusing or misleading (so the other part of the sentence 
needs to be fixed).

Cheers,
Quentin

