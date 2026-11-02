Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10841.1793620847141902642
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Nov 2026 04:00:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=YvhWeVeG;
 spf=pass (domain: cherry.de, ip: 52.101.72.66, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dx0kdTB9QDPwB58oUMSlxQZmnlIxIYR6WtunNN/q82/vj2fEL67JeHM7A7O/J87HmPkVpdyIjlWkPbdO58u/g96JqvXgdgvYADfQFABnKa/zc2SoYecbl00SmBo396ZQIKdIpCfWFu4ONOpiWIDdkkFIJauP2Nhsx2ER4N01SIi5ctSw7hegBGpdYwn6DdYKQaRCWTHuijqFpVexvsgGLefj0OtD6Bwx8fq+gEtRFtgj6Yi8kh2aEvvTwVLSuaqLHRPHTCvpmnssWWfTGLtJx9wtURLDpgONR183Qu4OKgqNm4XZvHOb5yFPrIxCXEPnGiHwPZ3+WuRzZ5tbB7HmEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ohelLH+J8If1Oy89W6qWLyoe/xQCzHV9nUM0ThoTLSA=;
 b=T77zT8AiXCLXpz3bmbePlDSOLLVKXRa5J6cr39mEeIB7fnOmt2f4T6Rpynq6o4bfdkd0IgjmB2Tzt07mCXn2cKUP6kIHPSzuD2d4R59Re2KsxrRP7gw0aIxmubc9KWSpSzREF/1dmYlZXNhOGxTLqvoMbdJ9hoDD+0lkbcqXgmgDdGoE4mzaTyObRsIQw+UMlBY31rJrPP2kOgm49sJYATK6NqvKRgTn9AIK/GbzStY/T36ZV8KneCXeybH5E2aYWriVDKseJJB/6W5kjgYs9gRIgYU8a312lkIaTqsXPHAV8OXY0IGVFzSr5XIEXYbcs8zHUqNxI/llXPnbQ0FhiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ohelLH+J8If1Oy89W6qWLyoe/xQCzHV9nUM0ThoTLSA=;
 b=YvhWeVeGWOFOLYt1KfqRSd/j0/fE9Kdhq0r5A4lLZ0MLSN7v8+9cyDHYhXkH83kOGHLA0TQbbhMQDJCuGJVFssybEQjMntg49BnBOUorVlGQM39yAb8TpppYPSSl7W8q3SyPrknbNv8BYdn7+X3wQOfixKynDVQhpnYsD6uY5Ng=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by AM9PPF839552E5C.eurprd04.prod.outlook.com (2603:10a6:20f:fff1::a13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 2 Nov
 2026 12:00:42 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 12:00:42 +0000
Message-ID: <2b3bdd06-61c8-478e-9509-4b0526e064b2@cherry.de>
Date: Mon, 2 Nov 2026 13:00:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual/faq: Add entry about github pull
 requests
To: richard.purdie@linuxfoundation.org, docs@lists.yoctoproject.org
References: <20261102110847.15588-1-richard.purdie@linuxfoundation.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20261102110847.15588-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIVP296CA0067.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:35a::6) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
Return-Path: quentin.schulz@cherry.de
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|AM9PPF839552E5C:EE_
X-MS-Office365-Filtering-Correlation-Id: 54e038a9-7d3f-469e-26e8-08df38d8eb6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|261026140227099003|22082099003|18002099003|261028144727099003|56012099006|261009223027099003|261021121427099003|261021123027099003|11063799006|10067099003|261022075727099003|261022105027099003|261026121527099003;
X-Microsoft-Antispam-Message-Info: GBW2jHcqdjuKK4cF9685gqcZ+3QtKarI2ueFRqaq+Zm2ykhTqPOqIGSHMtcLq5b4xKdAfbxmRpS7k6njTKiIX5ydjrUFqVeZ0NZBGY7xa4mNxi4ojHMNrLEE6mPpq5hcx+0PpOrI9FWuM69WldOduYi4d+r48tHic2XW/sjJvexZ1DsfDBpru28skK9RWm6m58X3/yT99HM2iEqwYykHn/wbHp3ZfTyVJ1isSMDJOa6Y8uX60AS9aBRWXVdpxvM4HziD4pIXdJZlmBaeO5d1N4KrLOemjoJuwvQDugSMTVxUFJYbnqvTPIiEjMeWPVIDRi9+PVW705qLFIEqKjrIJeh73ytZFrZtZ0O7JdVIODxUbITt5XRT3kalXYsBgLXhVYvbgjlV6YaE0Pnj1ik9guCqiEXnTgNcNzyUgn1M+w874Q46pADeImrZmC5oy8xWZ/3Rkf9NYPOSlBGSLqrzs8nVfFtPyeyhpfmnT36eRBWV0Ls91c7jOgnRX9de88uAcODOmrlo6gqjbrGynAT6OPdGmEY02prBYNyB8W7mxl26TXNTrsP0IVWoPntrk9fiDa/kPFG5KDuu14IW8q+ReB21anj4YGWlfnky4HsJfBXLD8Uf/PjhktsdjzfWYXnqerszK112h/v9xirP6Day8k03T80chYYecIz6XS4w+UI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(261026140227099003)(22082099003)(18002099003)(261028144727099003)(56012099006)(261009223027099003)(261021121427099003)(261021123027099003)(11063799006)(10067099003)(261022075727099003)(261022105027099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0Z0KzFwaDFSVThldXlBUWtRajRTaStaNXZrcDViK2xnSGUwKzJkSEN0OGt4?=
 =?utf-8?B?V0hUeGMzVk5vdDhiUzBCTmFXbG5SR0RSbWgwZWhhMzJyR2MzSWkwOW9hTnBL?=
 =?utf-8?B?YmZUb1ZtanRlbHV3NHgrOVI2eHppY3Q0Q0E5bjNTTk55N0ZvZTRZOVM2d29t?=
 =?utf-8?B?Rnd1bFVzR3diOGIzSndqQklzb1ZXL3RBSDcxUmFPY25jTDg3eDNvNWxlcmpp?=
 =?utf-8?B?MTFYdUQ4cVh6V1h5TW5aanpsN1BXeUUyS0lBejhqOVFVVUMvaXQrQ2lncHBr?=
 =?utf-8?B?NklkQjZnZ3ZIQ1R0V1FRbGRaQ0RlMllwZTA4Tk9oTEF1V0JZeURzOWtWbnVX?=
 =?utf-8?B?WnNSTEVUWDU4YncrY3JEbEFIVFZwZndiSWJwM3ZHbjhQbjBFOTVUYi8zM1Y1?=
 =?utf-8?B?T1k4QXNBQ1pPSmVwdTZ4S1NsOWVVS2tZMW92TmNHdXNvQ3NpTEQwbkxtejd5?=
 =?utf-8?B?bDBLMUpkQzRjbnU4azFSK0RjTm1sR3NNSlBjUWNaRmpGZll2RW5uTUJGSFVk?=
 =?utf-8?B?WHdDWTdmV0lLOG9UZ0s4T3dLMzZSVThMbXIyUTNqUWVndlZwY2N6by9wTDM5?=
 =?utf-8?B?V2NEbjErcWJOZHJQT2RJb0pFYWJ1VUdjQUhmQzVGYmMrU1BJSUJwcDd6VzZo?=
 =?utf-8?B?dXQ4d1VRQ3NKL1BOV2xaUVdwSjNOaUxVaW5xQWNFY0NzMlc4d1d5VHl2QWJ3?=
 =?utf-8?B?K3pGdUZLWmJrL0VsWXZYb2pncW8wS29EVm9ZYWc4cXdlSjZhKzlSa043akEy?=
 =?utf-8?B?QTBoaXdJeHZVN0dzZ0JVUlhNNlRsT2ZlaXFOQzg5Qmh1ZHgxNUdSeG1YcFIr?=
 =?utf-8?B?bjV2Uzl2UXlGZ3dwMFQwUEh1UDI1TEgvZ2F2MmpoL0poK043cVZmL25KeHg5?=
 =?utf-8?B?aGg2Wmg2bjFwWXp6QXd1SkRRa1l1aDgzU2JMV2NkdjFGdWVTaHNjRVkrdytj?=
 =?utf-8?B?dndpMVFnbG1sb0xXNUtpdTZoU2RMek9ZL0RPTUpoZjQybU8zb3pFZ0hNRzlO?=
 =?utf-8?B?TVlTcmhQMWFDRUNzdHFiNGNmWTR4ckk3THNncklIK2tmS25VWjlyTUxRWEo0?=
 =?utf-8?B?TUZIWXhrUDd5Rnp5OTMzQ24yQ20wUTFJYUFTcFN6R2Q0cGdvS3VlNTBCWG9F?=
 =?utf-8?B?WkNlbDJWMnN0MlpCVTBUdDlsT3IrcEpUZlphUlhQS0xjVHA2NFg0aEpETjJq?=
 =?utf-8?B?U3VSOHQwUmovdWh4OEhlYnMrRThPR0s5a2E4OFdwRFZtUy9naTExR1VXQUdh?=
 =?utf-8?B?dmtUcjQ5T2ZQa0RHZGFaUFhERnk2Q3lKeDhueVE1dDN6QVhIaGFsdkZPQWdj?=
 =?utf-8?B?d1RkYnhGZW9aQWZYb2JsWXNEckhYd2FoU04xRSszZUNoZGhGUTExL2luZ0lo?=
 =?utf-8?B?UGkvaHNWWjFibVErT0E1NnZPVE9tclBEZ3dPVmcxdldBSGptY0JjNmYvbjEz?=
 =?utf-8?B?bU5nWnIwU2xwdUJrbVE2NmM4eUtFR3RhZ0F0NVV4a0FDU3lOYnkrS1ZUblpO?=
 =?utf-8?B?bzB4ZXVxOHd1VWpzY2tjWVlFckV1ZGtQTHAvUnhJUE5oMDNrNUdmMjNjOFAv?=
 =?utf-8?B?RzF3UzNKRDVISU9WVURVT3FkZ2U3eXBFSnBWWGY4QjJGZkxJNElxSGdjSTZr?=
 =?utf-8?B?cUpvTlJ6MExBSEVvNnJ5Ty95NVd2Q1lYZG9HaDNrTXBSS0l3SEJtVVFEMm1a?=
 =?utf-8?B?cklWZURXcGZzMnYxalV2UVZxbmgvc2xwZnBmNmxjaXVlVzBBSVdWK2l3VGJY?=
 =?utf-8?B?NUdmbHo1dHhuNitIRllKdWNzWGREQ2NCNE44NDlzUEdieE9QMnYzN05EMmwz?=
 =?utf-8?B?aEx3Szd0N3FqMGw3NWpTSmZZUVBPZ0dhWVFOZ0U5U3JDeDQvNWVLOG85Wllv?=
 =?utf-8?B?elR4VVdWaWdIaVpvVG9iZGNXR0pOUW1KTFFZUHcremtaK1psckRLdU5McERU?=
 =?utf-8?B?b1p2ZGtCVE8rT3l0dGU2S1Z5OCtUclJwbjZka0RtK0x6VEtreFU5QWREeW0w?=
 =?utf-8?B?WlIwWWptSVZoVUJiRVh3MDlMUkMzaXhxbDJPZW1Rb1FYRStSUStnNEdic3dz?=
 =?utf-8?B?dDAzejdvcmxmUkNEcDdnTTlxekZiWktMSytDM3VuRE9Ybk5vMGxOcXpPUTFM?=
 =?utf-8?B?VHRZWlNlcHFzTGtNUVZmVWM1K0V0N1pqdjV2NWtJaEhWaEJnMk1JU1RPSVVB?=
 =?utf-8?B?QTk5cndvTXFjYi9iS2xkK3R0ZDRBck9CQ2h5VjdOSzlRTmMzY2hzUjhDaDVQ?=
 =?utf-8?B?ak1VL3ZlSVJXR2FhS2Jtd2k2VGQrVjM5c3JobTlISUttWC9iSHR2Z0pFN1F1?=
 =?utf-8?B?aWhILzNZcGpxSjY5VnZOTXVzSXp2TzN3WDlUV1N1SzJmMDNtMW51Zz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 54e038a9-7d3f-469e-26e8-08df38d8eb6c
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 12:00:42.4858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tAFK6Bhby2O+En6XwLtF00cwgzqPHR/wS1fFu/1divwPXxcqL87mFE2pdIz9YtyGy2XV3FZn2AxCaXYv2LmGsEh1mU7fpdVvNHNa0ubfqYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PPF839552E5C
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Mon, 02 Nov 2026 12:00:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10759

Hi Richard,

On 11/2/26 12:08 PM, Richard Purdie via docs wrote:
> This is an emotive topic but try and fairly document some of the pros and cons
> of such a model and where they make sense along with why the project has made
> the decisions it currently has.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   documentation/ref-manual/faq.rst | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
> index c1657d677..60e89d834 100644
> --- a/documentation/ref-manual/faq.rst
> +++ b/documentation/ref-manual/faq.rst
> @@ -108,6 +108,34 @@ It is very easy to check whether a patch has merged by looking at the repository
>   pulling and rebasing.
>   
>   
> +Why doesn't the project use github?
> +-----------------------------------
> +

s/github/GitHub/ for the whole patch.

> +This is not a simple question and there is no right answer to it but there is some
> +background worth appreciating.
> +
> +Some components within the project do accept pull requests from github, others don't.
> +The README in the component in question should make the process clear for that
> +component. Github itself is a commercial operation and there are concerns about what
> +happens if they change direction or decide to to discontinue it as there is precedent in
> +the past for that kind of thing happening. Equally, there are open alternatives to it.
> +
> +The bigger issue is the model. Mailing lists allow for wide peer review. The people
> +performing that review are extremely valuable with experience built up over decades.
> +The github model doesn't really lend itself to them being able to easily see or be
> +aware of changes beyond the maintainer accepting the pull request. That model also

There's a CODEOWNERS file "standard" to specify those (free tier GitHub; 
paid tier GitLab) who should be reviewers of some files in the project. 
However, this is akin to having a MAINTAINERS file like in U-Boot and 
Linux kernel when using the mailing list contribution with 
get_maintainer.pl script, which the project doesn't want to be using, so 
this doesn't apply. Just wanted it to be mentioned at list on the 
mailing list as part of review because I have a suspicion this might be 
raised in the future.

> +tends to focus on the single maintainer with total authority, which for components
> +like OE-Core, simply isn't how things operate for us. Moving to much a model would
> +alienate our existing reviewers and our community consensus approach to changes.
> +

Can I suggest adding something like:

"""
Another issue is that GitHub and similar forges use the Pull Request 
mechanism, heavily leaning into reviewing and testing the Pull Request 
as a whole (e.g. the CI only runs on the last commit of the Pull 
Request, and per-commit reviews are painful to write and follow-up on). 
Using GitHub or a similar forge would require the project to completely 
change its reviewing process (or have two, wildly different, if we were 
to allow both mailing list and Pull Request-like contributions).
"""

as another pain point for using common forges?

Cheers,
Quentin
