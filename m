Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6118FC021A0
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 11:05:59 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.33])
 by mx.groups.io with SMTP id smtpd.web10.48806.1739790350177485274
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Feb 2025 03:05:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=JsM2HSbv;
 spf=pass (domain: cherry.de, ip: 52.101.65.33, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mKriIbkorx2W+7QBr19fa/bKny0+RJQUaD7DU2FBmbl3kv0PsZAShtSrJ2I7wGGlFLuG3++HZWIN0JiLPUdax1r5sdCO4eJf3sEgZSBaRRccf2zCiR6zkLS4qNWeIMOrX/gYt0AJwrEEpJfE3q8+NHxpPTu4p2jiW7el3Uspad6PPa3dRK3qV8gBiMfTPc5Uolf5kWfycGZDI5G/HNJn1Oz0ESORpKpbywq01AiZkXGmOO6SocjSQukvg65OhphiMq/MAZDJV640EMnXjWeUGoy7qMICVwvoTNvpzIhYJi0jQaAPB/EJQIlh4XvkUKe8Ra6POkBkAS3aPj/m/fhljw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZNtV5zGw4n7wfeF8P5OM74rekcXuhBF9qsl3QqMpwlw=;
 b=Rwwl/ygjpQJdwP5Wp5D7F0/kL6Oo77ZSuIOOgHfCE69FrYx3bI7XukDJoaKsXe9ZfMdxl310dDTP1WbtsbULIW0J6TmFo4otxpiq6ZoHGR8d2mzbVPuCweJTAGOlMCSrXqzIk2c9oO6cGwTUgQyVZtssFug7HX0UJ8x64uajMsu+QBnlrys0E/3KKGdls+KgtDSMrZZOFtuCDvhNY1TEmoz9gfW1hDIumge/Hkbd9lbtbUjZ51POEN4MIGWmk6q2201UkKppdUI73jDTtifeuiO/puLr5ahYSsYxLKztcL6qualFy9WwMruromyfDCacvrGyZ4bMBJ05VzpYbXBmLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZNtV5zGw4n7wfeF8P5OM74rekcXuhBF9qsl3QqMpwlw=;
 b=JsM2HSbvWqlM2UAUeyNWv3fVIo++W+UnukcgVO9kXpmQAhPTa6CifZO4NYmx1LodXYVkOk+4MGWPjNJ1CgON41787wRTiWfwkX85m39+UVuU6ubUz2d9KCdYTetCuRndBKk1f5/6Qs6bRxwIZugYDuRB+pFMFLi5Nn5EYOhjLrA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAWPR04MB10056.eurprd04.prod.outlook.com (2603:10a6:102:38d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Mon, 17 Feb
 2025 11:05:47 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8445.016; Mon, 17 Feb 2025
 11:05:47 +0000
Message-ID: <2c6e1cdb-c1fe-433f-9fb5-c340356311c1@cherry.de>
Date: Mon, 17 Feb 2025 12:05:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v5 1/4] ref-manual/variables: document
 OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS
To: yoann.congal@smile.fr, docs@lists.yoctoproject.org
Cc: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
References: <20250211234738.2633971-1-yoann.congal@smile.fr>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250211234738.2633971-1-yoann.congal@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::14) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAWPR04MB10056:EE_
X-MS-Office365-Filtering-Correlation-Id: f59124fa-1058-488f-de4c-08dd4f4307c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?djd5NjhQcTV3WVptYmRSSDVzWXdhVnM1TjVRUFpkQ3BHVllVY0lGcGlyV2VU?=
 =?utf-8?B?V1ovSjlWVWU3UTlzc0Y0MzNUYVc3cENDb2VUR0RjVzZCU045S09oNUx0Z01W?=
 =?utf-8?B?Ykd4Rmx4SGdHZDZCUlZUc3gxNmwwcjl3cHB6ZVVycmRwa1E5ZFpXNWRWSTdx?=
 =?utf-8?B?NW5ZOUJ1S2czTkJuMjhZNjFnTmk0aE16aEZIT3o5TElzQzN3OXBoazRJMld3?=
 =?utf-8?B?b2RvbXdRS0lPS0lua1VEbVRwSllJV0hFbnBMc0hhTENYaTQ4NE15YjNnTmJZ?=
 =?utf-8?B?TThPcEc3REl3VksrUjFUNUVFNjlsREhiLzBiNldKd3JSUjJxaVVYZnhFM2Yr?=
 =?utf-8?B?NUhYVGorSkJNS29kdVlnNVJHVlAvRHpFdTNrVTNRcG9vazUwN3ROaUZUbFJ4?=
 =?utf-8?B?S0tsYVB5SEMvSXVKUy9laThEcGhjZjg1Q3l5R3F1SzFsdTgwY2dTdm9kYWlr?=
 =?utf-8?B?WWM1VE50TTlDdENKOFVaUWtyRStZd3F4aVgzejRSY2dhQU9EUEtBckJibEtY?=
 =?utf-8?B?SXZHc2VuUHNyZ25jVjI5N04rcGs0U2lUN3kxd1N6RnE4MFhkZURWbUdIcnhG?=
 =?utf-8?B?MzA3S2VJNkxQWUxpcmlkZU82S1NoNVpBVXMzY1VnNVpBRXY2NjZDSWFsVG9y?=
 =?utf-8?B?WjFhbkFHN1NiQzVoaVZoaEJjMmIyVXpUQllaNTlycVlkek9hSUpBWVRkUGpU?=
 =?utf-8?B?NE9DaGdXbW1JWGVSaGRWVmNSUmxCYU8rWFEyYzVVWWdvQ2RXQUJobE13WWtO?=
 =?utf-8?B?V2RXMWREVE1saitKNXZqV1UyeVd6ZEVFVXFDaTg2VkordC94Rk4reU5Ucloy?=
 =?utf-8?B?UzdaUDdzL0dxQVhsV2FTZjZwanlTWlJPdWZ1STM1NFpsWkVoQWVlR1h3S044?=
 =?utf-8?B?cDU0QUcwYkYzVnNxM0lFc0ExeG9Fa0orVU5PY054WmpZdmdZNHV2U0dsbkl6?=
 =?utf-8?B?MURqQ0kvT0RSV2p3WXY5bDg4MTdaNGlLNGdSa004dzQ1WWpTTUFsWExRZnV4?=
 =?utf-8?B?ekZieEJVZkhLc0M5Um1BQXFlSWNlWlM5bllVa1FvNFA4RHJYeXFYeXpTVENV?=
 =?utf-8?B?OFhIeVdPV0EzeTh2ekZhUUpvb01SYndqVjBqYm04ZEs3OGhPOU5PdmFLaUxn?=
 =?utf-8?B?VjE5Wk9Jem91bmN1TTNremJlci9DRnpmZkJtVHNhYkxDYzZicDFxb2pEb1dD?=
 =?utf-8?B?R3ZOUE5rTUJWV2swbk9qaFE5UFBxRUdBdU1QaTB2eTRtakVUa05waWR0em5w?=
 =?utf-8?B?RWNQZDlOSGZoWVYxYmtZSE1FYXI4SE9zU3dyeVFPQW9zZUMzc0FwVXJtdk0w?=
 =?utf-8?B?TkZreVY5SGJZYjc5TUN0T3Z2MlczbDFSMUdFaThoQXRseFpsWlRtUmRneVVJ?=
 =?utf-8?B?R3NnUmk2VGN2RGo5QTdsNHA5TWplRkVhaXZOeFl6NlUrQjNpM0NGbmFvby9S?=
 =?utf-8?B?K1RVRFZDQUdZSnhVWUNyaHlvUjRZQ3JjVnlnNGZtSkU4Z0lDa2FHRzBsNEc2?=
 =?utf-8?B?RllVNTJnM09zeGlubWcrRHJMblhtejl0cEIxekFlWkwyZC92dDdpc2xIT3lD?=
 =?utf-8?B?Y3YzVzR4ODhlSGdBWU03VTdSTlZrSW5oUzlnMEF6RnB1dXJqNnhvOG9qQWZj?=
 =?utf-8?B?cXBLNmpWRlJxR3hITHE1OXlMaEM0emRlMnZvYVRUNW5ncFo3cDdXcmd6VjZ5?=
 =?utf-8?B?RXNFclBXRjVCQitUcVJTZ2JEZGdLdjVEak1ERHNIOWVNQWZJSkZlRHk0VXQ1?=
 =?utf-8?B?SGM0RHNaK1Jtbkx0RlI2NEU3WVdrTHZjV2hLWjEzYmRJNmVlT0t3bm8zRFNp?=
 =?utf-8?B?dCtXb1c4VHliSVlzWGRUcGREN1Z1VkthMlJ5VVV1NVBneWlqRnpOQ0N0SzhM?=
 =?utf-8?Q?gFuor3+qw8IPR?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZFQ1NDdLUVREUUVlaW1wMXdrVHVNQ1plUVBRNDRzRytINUVqeloyN3J4QmRM?=
 =?utf-8?B?SGh4VHRIRXdhL0N5M1lZRVBrZHBhZ1ZzbEZLQkZZajUrbU9KTGhXQXRudW5U?=
 =?utf-8?B?OE9GZUdQckRwRXJXUDJ6UmRjRHhnbnIxQU9BbFloTHVBNzBvVnJmMGpLWUtU?=
 =?utf-8?B?MjUwRTZqS1k0TGhjZVFacjk2RWNOWWNHWHZRK3N1K01mYm9uMWRZbTdJU280?=
 =?utf-8?B?bStYNEIyNmx2UlkrbUFCWU9Rc0V6NTRkMDlaSzVsRmZwQVloZG85QTd1b0Y5?=
 =?utf-8?B?V2txWU8vcGdyTDVlSmZWeGlQWUd4ZFNEaVg1NUtSb3lDd1ozQ2gxRGVLT2pR?=
 =?utf-8?B?RXQvdzlZajRKRG0rWU1scFJxNXF5MzVvSVZValJjN0x6amFDZEpyV05nRUJM?=
 =?utf-8?B?d0o1MFpTcjRoWW5sZUo5UFRqSmQzd3FnNFptbmNOYmltYkt3QVZIMTQ3aFkr?=
 =?utf-8?B?SjNIaWNDSExpRlNJL1lTYkttVnQrTEg2OG5lTTkrbUlOZmErYzNQMVlhTnNy?=
 =?utf-8?B?OHhHOElIN3pXWE9zUUM0b3ptQ3BORHpjTnFEalJweXhPWVJkQTFCYWJGdHRL?=
 =?utf-8?B?SjFuN1JhS0lIcnBrYzNFdzduUFBpZ3V5TnlKVFprZE9CNFRJdm5VdzNyclZJ?=
 =?utf-8?B?TksycENGOU5rV3E0WlpHaEI0aGpYZWhMbmovMUJHN1h1TnNXbmdidnU5em9t?=
 =?utf-8?B?THJpb0hwRHRCRDNITnZ2M1pKb2xoUmpVRFBoaThoOHg2ZDg2K0JIaUNuL2p5?=
 =?utf-8?B?cjlxdnhDSnY5a0Iyc3FlREN3N3NJN1U0V0VNNnc1Z2RXNHpkUHJ0WDFTeTRr?=
 =?utf-8?B?bCszNFczRGt5ZkhnczJJZElVV2lYcEtjU29TZDJDMEdZU0llc3ZOcDJFZzVv?=
 =?utf-8?B?cDVLbVVieWVZSGF1ek1nN0pWM2dFeklSd0wwTUx3dW5oaVNLR2pHWnRzSEVy?=
 =?utf-8?B?ZlR3cEY5c0Y3Y3JHOFFIR3Nsa21sRlRmYmZ4NlJqZTNna1ZaRjh1WGxudC9a?=
 =?utf-8?B?UlV4NEpNQktybGtYOVBJb1JXSmlSSWJoa2xUVE9MTDlBdzExeG1QY0JTZm4z?=
 =?utf-8?B?Ti82Q2YyK05ROWMzemVCUnBodXFIdjNYdWZKL3ZNbmRybnZpM2tjRm1ZY1Zx?=
 =?utf-8?B?Skg3RWlVQnc1N2s3L0puaWRTWVZPTUxWMkg0a05vNGp1UDBIdlNIYm1iTEFJ?=
 =?utf-8?B?akRHKzArTzdrZDlVNzl1ZWpCcUU0SFNtcHYxNUtjVjhiTVFuOTZCQmJpU1A0?=
 =?utf-8?B?eWY4M05ZbEp5a20zK3grbHpkRThOWDlacXZyNGE1TnMvRDBJbGtYUDE1L3Bv?=
 =?utf-8?B?ZitQRUJJcFQ0OEkzdmlpSnRPZ2ExdVJMd1JnSWk3NXJDUlNFOUxjdzZvaVpC?=
 =?utf-8?B?eWN3ZzBmQnREOFVOZ01YbytPSU1Md0FVR21ZdDRGc0FEbEo4NWIyU0d2cGps?=
 =?utf-8?B?MU9DL0dYWjdLL0FZYkduMFBPME1Za1BoT2hTY0tXZ1I5ZHFsVjVEUjlPQUFT?=
 =?utf-8?B?NjczMEV2bWFEd1BVbW8vQXYyWDVvQ3l6OERaMUVuU2gvLzNFbnhnL0Nwd2Zs?=
 =?utf-8?B?cWZHL0F1Q2dJZGJ6M2twR0dxdkpKd2x2aFBnOE5IVWxJMmRsQzJ0VG5KYW1p?=
 =?utf-8?B?NFBvSUU0Q0VvZGtqQVJFK0tCSFJaTnlSTFhqK3djVXlGSjgwSjB3YmVWd1Iz?=
 =?utf-8?B?bkNPNmdBNUZkd3hjdE1jRDZGWGZGMDlrUGVoN0tYYkxUTTN2d1daUzJ6bXJL?=
 =?utf-8?B?NGhOSVY5VHVjK2JrLzhIcWMyK0JWT0U5Ky9WQW8zc2dBLzJEaDJDeGw3clpK?=
 =?utf-8?B?eDNqZ3czVXk0YnErREV6WkFWNXcwMDc1VXdtclBZUC9wTUV6S01Vb3JXOC9r?=
 =?utf-8?B?c1lTMDdKQytnQmNCcHFLc2VFaENNS0FiUTdkdVBSSnhuSXl1dGVHNHZuOEw2?=
 =?utf-8?B?SHpSZUxXYkxDZFhkVTc0enh2MHdldVJqOTg5WkJ3SzJwU04wNXoxc1VodEtp?=
 =?utf-8?B?VytFZGRwd09Sdk00ZmJWaDFIMkxIMEhSVEVFU1pPc3NURkNkRlBHaFBZMDBN?=
 =?utf-8?B?KzhPVVpOTHREdXJLRExWM0dKcjNHbnJqOVpvT2VOTUFoc1ZnZmk0eDRBMUI5?=
 =?utf-8?B?N2QzWlhMY3ltOTd4THdoVmJ6UXhlTnhKdzBhMkFxejhuZUdQSTQwdS9xZnhF?=
 =?utf-8?B?dEE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f59124fa-1058-488f-de4c-08dd4f4307c5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 11:05:47.0880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IRBPb9w1ehm3KXEdzfGt0OIjqVEclAAukkYCLMkWSNcdJTlK+E1eWn6+qEigJL8yRZc7Og/4KO/+ChsjQQmmGg4pk30YH6TU+KLr/ytSt7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10056
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 11:05:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6376

Hi Yoann,

On 2/12/25 12:47 AM, Yoann Congal via lists.yoctoproject.org wrote:
> From: Yoann Congal <yoann.congal@smile.fr>
> 
> This documents the variable used in the "automate testing a single
> recipe's reproducibility" feature [YOCTO #15701]
> 
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> Reviewed-by: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
> ---
> v3->v4:
> Quentin's Review
> * make missing dependencies more explicit
> Guillaume's Reviewed-By
> v2->v3: Quentin's review:
> * s/target/target(s)/
> * Removed Guillaume Reviewed-by (given privately)
> ---
>   documentation/ref-manual/variables.rst | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index adbef69d8..d56eee3bb 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -5807,6 +5807,13 @@ system and gives an overview of their function and contents.
>         For additional information on how this variable is used, see the
>         initialization script.
>   
> +   :term:`OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS`
> +      Set build target(s) for build reproducibility testing but activate
> +      :ref:`shared state <overview-manual/concepts:shared state cache>` build
> +      for most dependencies (i.e. the ones explicitly listed in DEPENDS, which
> +      may not be all dependencies, c.f. [depends] varflags, PACKAGE_DEPENDS and

My bad for not making it explicit during review, would appreciate proper 
highlighting here, e.g.:

:term:`DEPENDS:, :ref:`[depends] varflag 
<bitbake-user-manual/bitbake-user-manual-metadata:variable flags>` 
(please check this works, I have my doubt around the square brackets; 
also note s/varflags/varflag/) and ``PACKAGE_DEPENDS`` (since we don't 
have a term for it yet).

With that fixed,

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

