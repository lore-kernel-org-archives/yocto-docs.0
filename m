Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A520CCD194
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 10:07:12 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.61])
 by mx.groups.io with SMTP id smtpd.web10.4384.1760609228527629474
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Oct 2025 03:07:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=d7kOXLoX;
 spf=pass (domain: cherry.de, ip: 40.107.130.61, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g0RUUSHruthkQngQVYHJlWf9u19bKYekN9QQhGC1hv8yazNfdLf1zqyL21Dh5UqKW1y25xg/l93blJnUSBlfrBufn7ch+7nPUrUtj/B7n6P5N6koJ6PC4ZbKwcDXjFkE5k81QORUfz7bSlU/iosx86V0QupePPM16dwxUNUJw1TqElUh25Lfy9uorzj6jLMKTx1kHsvRKpVOwDaiVTXcWnqedlxxFjqoNFerd2EYdtvyALBgDWTpsAGoM5x0pPpuhQNu43iMK5yQBDw9f40ghNbJrmU5oxpVEzeWnQtdUKiioV0MGkxdhuD/F74xLGDvoflCbgvwmYK2sR5IwzYKlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/s6OHWWU+CE3uPkYDq859izqfJPOR12KLFsAHWZrFVE=;
 b=WxJaQoQLTycbsyqbnoQzF+u54KWFICqgiz/py0HOE3rmbluxRpwCEDg3/2oKY+L/5fThRld86GSb9bxdtD2cEPIyovOykaMOQMR6XrVXvy2a/DznbbzUKrd9WF9X7iJ+htxm3T9vvo/3/6XfbPhJIVumnW2JDC1nuhMY+5z/lX1YsOWH/YdbVykafvGF/Zs+Uan9zylnxhL4dxLn9AWJju19/IcHHxcjhtd1MmRoBLQddq01YTe5PNhkiLrhd/rFDzc7Zfq8F9/Sr4wPv8aqN147s/pS/C4L/oNMT1SDD/qFtgbjgb4SKctTapDm5xWfIlJkEtRDj3WGsbYLVPmsSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/s6OHWWU+CE3uPkYDq859izqfJPOR12KLFsAHWZrFVE=;
 b=d7kOXLoX9PZ7Wq5DYVHbZK5TBejuSJ4sJe7W9o/Bfn3c+Bj9+d2qUmncBxLqKe7w6wV3QD9d38WvwyNky1ZdpLjCix4qeDUrsdo4u1cmR1iFfqkoVRL8nM3aIkR8gNScz3r480ViDyQ7NJAx0q9SJ8+87wZ3Ze3/lFbGwVby7tg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GVXPR04MB10635.eurprd04.prod.outlook.com (2603:10a6:150:21b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Thu, 16 Oct
 2025 10:07:06 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 10:07:06 +0000
Message-ID: <dbd7dc6c-aa53-4c0c-9bc0-dd9c9adf4baf@cherry.de>
Date: Thu, 16 Oct 2025 12:07:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 05/17] ref-manual/classes,variables: document the
 CCACHE_DISABLE variable
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
 <20251016-release-note-5-3-second-hunk-v1-5-20f21db1f93c@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251016-release-note-5-3-second-hunk-v1-5-20f21db1f93c@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0253.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::8) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GVXPR04MB10635:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e668b0a-5916-4a3b-b97e-08de0c9bc283
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RWI3TUVRWjNoU0t1T0twWXU4KzRiUGp3RmVlelRxT2Y1WjZKRHhSZlVUQ01O?=
 =?utf-8?B?aVZYbjVJMU93U3hMZFE1RjB1SExHUW1pSGhkUFFIbGFlajM4a2VEVytmVDlH?=
 =?utf-8?B?RmpHWVJwZllOK0pmejlFdVVsSS9URlBSd1VRN29jRkdRTUFOVGl2RFpiQ0pX?=
 =?utf-8?B?VVA5U3RrL3hGRzIxWEVRU0IvcEw1UElXUjcyUkdmR0xDMDRnQ2svdVlKMUhm?=
 =?utf-8?B?ZHhXQUloVitzWnlheTgxM1J3YkZwNG9PS2RERGdQZ2VzbUF0WEFaRUZwNk40?=
 =?utf-8?B?WkR4KzlMQXhHaGNGVHZEN3J3NlNHQXdmUHQwekxqNnN3bkFNSWRSdUhOMVpC?=
 =?utf-8?B?bk04NUl0R2IwdjJZeUVDUElrWXRremx6T2RkNDhVV0NCY3BZc00wQVZkbk1k?=
 =?utf-8?B?UXR6TkxCOXZsQ1dJV1VveFdDRWpDQjJVQjlCWFA0dUdpdE52OTdwMXExdG05?=
 =?utf-8?B?UVFWZmlmUEh5ZlZjNGc3QkdDN2VhdGI5M256a2JtMWdkd2JZWGhvYk5FVytn?=
 =?utf-8?B?N3dqUnVaVkFPVm5MV3BMRFRHbmxLUXY0cDZLNDFoOENYWG1jT3B3bWpWWnZp?=
 =?utf-8?B?K1hBa2YxRTloQVY2NzUrZHRORWFxZ3g1b0RiTlplekVlVTNuZXJIL3Bpd0Nv?=
 =?utf-8?B?UmVGaW1FdHJIOWVXeUlBLzBHcHVTaTF5cTFSSU1aQ2hDQXBldXJldXZLWWZD?=
 =?utf-8?B?WmJlSGRROEh2MlptbG9GRTY1cU02d0dBTjBJRnNHNmJ5WXh6SzlqYW1LQTRK?=
 =?utf-8?B?Q3F3YmJoRHRYWDhhTitVV2QvVDRENDBaWm9uNFhDWGg4M1A3ZnpTTUo2c1hM?=
 =?utf-8?B?clRkWlNEeWQ1bytML21odWpvZ0t1NVp1aUNMVk10WVd2N2pPbGcxWEh0Y0lF?=
 =?utf-8?B?YmxQd2VlQm5IOGdkcDFWS2Q2S3p1ZncyR09QNTVkWDlQaWgrSFl3RTRvZXcy?=
 =?utf-8?B?UVc0RXk0RzhQUmliZXlvaUVGd0JkSzYxSFZlYlRIVEFTRlpWUlpZL0ZnNC91?=
 =?utf-8?B?cEdVNVpRNEY5TDNPYUNLeENJSERRbmdOY1BGcE9EaDN1czdWYm1pVFduOXBF?=
 =?utf-8?B?SlNzNUR0emtOTFhYUmJxa2ZkVzhKUFpzMyt5SDFnaURsZktjdHNBZW1SdVpT?=
 =?utf-8?B?dzB1WTBvdFcveFlHQUdoSFlad1lOcStqcmdHaEQxNkdNQkswRlRUYnZBOWRu?=
 =?utf-8?B?My9pMEVYUWdqVzVYMFhQMXhTbFVYR0dMLzlNSkxXNGQ2cytrSW00NENZMlEr?=
 =?utf-8?B?RllhT2pWK25teGs1eXJHMWhneFJHVExuV3QreXMxN3dWd1ArbGNSVHdGTHBS?=
 =?utf-8?B?WXI0SUdHc3BjMXhINGk5RnRpL2YwWC9NWUlNbGFFM2JBbVlDK3BWcXNJVzVu?=
 =?utf-8?B?bFoxay9rd3FTeS9qMU1Sa1E5TkRXZUxPSjFzZ2F1bjIyc2ZKRGFIb1RQVEhN?=
 =?utf-8?B?OGx0eHdYN09NNjNZR1N1Rngza1JmSjAwKzVBb1hMZFcwcXNUbG9UcFB0d0I2?=
 =?utf-8?B?YzFQUUZLNExtcmtxRUJTSkdLWkxxemdWWXVMb0V6TlJxcGtJVkloaXpMekFG?=
 =?utf-8?B?TUV0T0YrNmE0RFJwd0dHcitZNmN0WlQ1akdYWmxYQWRVSXBJSDlrdlh5Z3N1?=
 =?utf-8?B?TllCWEFiTnVsVjRmanhxSVliYlJjMUdtRlVnbzg1V2FBSDZ3VW84c3R6RFVw?=
 =?utf-8?B?NWFFbnl6Q2NsNUlqL2NoNTcwcEwrNGtFbHlVVlkrZ2YzRGlzRVJkMmdna3Ux?=
 =?utf-8?B?ZzBRM1hNTFZxdFZaNVpxbXFWajE3V2Z4dGxiYlc0RVZBZFgvZEpvZXlxM2V1?=
 =?utf-8?B?bFN4VEZpdGIwRUZIODBFSnh4K2lvNFlaQjl2WXdiVmIwUy82T29rbS90NytS?=
 =?utf-8?B?S2hkOGsrVWZYZkdaenpUYlFVVmFpb0VoSVBjVEtMSWpwRVdLbjRoVExSMkVs?=
 =?utf-8?Q?NWSGMI6rrjtAg3Qc1B2YgQHjHC0Ibz9h?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?elNyUnUrT1FWTFhNUjBjcnhoSEpGNFdSSWtabGpVUUJVNUxabUVsNEs5QXhB?=
 =?utf-8?B?MFhrQ29TZlFScUV5ditNUytkeXZQbVAzSm85VzFyNENTTGNxSFp6UW5zb2NB?=
 =?utf-8?B?bnFwMEhpZEhOdEpBcVE5N2o2cEFBd0xLaDhDOGdzeVBYK0lLOUsvenFCemh1?=
 =?utf-8?B?M0JmaXpDVjg5cG1OWkpQSyttcWxMQWhTMExFNEptTHl5V05FOUtIRkFwTU9i?=
 =?utf-8?B?bnlKODdPdlBFTkxyWGpXSGY4cTRUMUM4SmFZZHRiMkE2R01VV2FMYS9qYUFx?=
 =?utf-8?B?a0pIRCtmc3dWNUlVaFJZbG1CN3lyejZVRmhZTXpNYURiYURUbENZcGt6OXN2?=
 =?utf-8?B?dWNncWpoWVNkRlJDNVJ3WFllTGlpazQxQlNqZ21FMEM4VTVpWVZvdnhqSXdk?=
 =?utf-8?B?aTB1RVhqU0xIbGd0YnoyQSs3OUwwTDRRTityWk9nbUZndFFrL0lXQURRSzFO?=
 =?utf-8?B?Z1AzVUFvbkRQTlVGcmRwSENBczdQNXM1Ym5PRmRJNjlOSTJ0ZXlVZTZON2NS?=
 =?utf-8?B?Mjd2eHJYR2R3b2JGbkNGenJwZ20yY1JpeUppeGlGdVpEbEFRdncybUVpTjZV?=
 =?utf-8?B?a2wxbG9VNE1jNnJJSDJ4MjRrZVpDT3NCYTlwSkxzUFR2NytYeU9yWlJJVlBN?=
 =?utf-8?B?eU02Z3B0YjFSWjV3dkR1NWFTblppa0tXVWRTQmE5dUlwdzJtOEZCMEZzbVJD?=
 =?utf-8?B?cW1SaTZwOG4wM0EwNlZyWW8ycGxMYnJqT21YanVlTUFwYzhlTzhLMis5MDVs?=
 =?utf-8?B?WHBzeElMZndlcGRmcmxCNTFMZ2R2cXJEMHJ3c0w3R2kxbzFqbnh0bUM4WHVY?=
 =?utf-8?B?akRkeHkzQURqUmNndUdrd1h6elRkWjVJcllPV3kvcEwwa0lvOSsyL0V4SFll?=
 =?utf-8?B?SVQwWUZmKy8zSC9vOG9JelJkMndzKy9vbVhDTlJtRkM1TXRJODBBaGI5eEVG?=
 =?utf-8?B?dnpGc210M0JzMDFhZnhwdDhZbUpkQkRyM096amR3U2ZBVXBZS3ZlUUdhNFAv?=
 =?utf-8?B?cERwUUczTTJTRGd2QnVyVmFsU1BSYTVsVVpaMU9tZ0Y4N01vSjdkYTdPQ0Jk?=
 =?utf-8?B?aUIrTy95TkVCS0lFUk0rUVlCVHBsV0NGWjRCK1pDU1J4VWZHbHZ2S2k2Z3Zh?=
 =?utf-8?B?VHpjcFN5eTM5ZWQ0cC80dlk1MFBhbTJ2cXdhV3RkUVEzYTcxdVdyTEdVWVhO?=
 =?utf-8?B?RHhzVUlUNGFzdFdvdGxxRE5Pb0pVZUs4YVBVYXQ5VDNKNmdRQTJzYnkrZVli?=
 =?utf-8?B?cVZjKzYwem91U0M3QkR4NmJyOHQ4akZpdnc1Q093Y085MG5MaGphY3Vuc3hi?=
 =?utf-8?B?dERxcDVrM1JUS0VmOGFiYVZUekJsbk8rVUdrYlRZS1JyL2dXNzZqd1AzeXBh?=
 =?utf-8?B?c3R5ZThyMi8yUFUxSlR0bFVhSEp0Um9uc1pqSzNiN1F0RzhFOFVUWUFDa1I1?=
 =?utf-8?B?cktMV0Nuc1BmUU5NTFpRL011K08rcXp3bnZVOVNxU0JqNUlKbDJGV1hrYWpT?=
 =?utf-8?B?aGM2OEQxRnBaU1JQSlQ0OHR3cWtXa0tMaEZhOGxwTVlhcUdJL09OSVMvekt0?=
 =?utf-8?B?cnhYWlplS3JUaTUzQ3l3OWxLRFFjOE0yVzN2cGpxYW9QaXM4eW1SeFBGS244?=
 =?utf-8?B?eUc1Z3lSOXhBbnUrUEtrYUI2MjJHQVF1ZUhNVVQvaFVLTXY3eS9UVG1STlN0?=
 =?utf-8?B?cS8raDJ0NmVYaTBPUWVvVE5iam1qaUk4VmE2TkF2czdITXNZdG12T1hZdXRY?=
 =?utf-8?B?cUdNWDE2ak9kcnhZY3BwVTE5bGROOHc0RElYcGxwazRJUFFCTUhBZk52aEVo?=
 =?utf-8?B?bHpBa2FQb1d4V0Vta3dPM05oVE9IL0RHVmZadk9Dd3BKWjZlU2diSUI1T1Fn?=
 =?utf-8?B?SjZ4MXZ0TUhhNUdSWTF2RFpkODBXTFo3azc4V1pvenAycFZwa2M0cStPeGVt?=
 =?utf-8?B?VUx0aEdUWTEySStHYXhwYVlFUW5qenJPYVo2UmphSG5CQUwyQ0xBSVc1MGt3?=
 =?utf-8?B?U2VOL1F0MEVQMnByd0pReUlFRFJQQmxRSWNIRm84UlhhK1FaeUZWdlJVOU5w?=
 =?utf-8?B?Z01MdC9VUDRFMFNSQ0VhS0xOeWZRR0M4eDlHb2h6d3paSk1xSDRpUWx1Q1Vm?=
 =?utf-8?B?UHdyRm1va0tydjlRMXFwMkVpRHBiU282SFVQYmdqOW1pa2ZIUU9sTzM0djVC?=
 =?utf-8?B?WUE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e668b0a-5916-4a3b-b97e-08de0c9bc283
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 10:07:05.9648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: upF22yeCFdB0p83a17UFhhkA2Dk9Easrztnz39Ej+toAXCo0xTaQzN6y9mTOWfJMezVfYps00yug55IxWdMSP2Y2mWAeW2QnXKgfb64FhIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10635
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 10:07:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7729

Hi Antonin,

On 10/16/25 10:53 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Can be used in recipes that want to explicitly skip Ccache support when
> the ccache class is enabled.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

I think this has been the case for a while already, so maybe we can 
backport it to other impacted branches?

Thanks!
Quentin

