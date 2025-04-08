Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3010BC3600C
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 12:42:10 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.64])
 by mx.groups.io with SMTP id smtpd.web11.73628.1744116128937584817
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Apr 2025 05:42:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=f9TkWQgN;
 spf=pass (domain: cherry.de, ip: 52.101.66.64, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t5P7mIREptWHfVwbjrOnqAvhQ2an7d4YlZpzWcYGLLXprj+D1a2T1HUpdDRle1qYVQQWiW1ZUr34HXSnXl+ssAYQXCUlVx88FBgUHriH+OVNp1ds+DQoJH5RPvR8MFzKnNnrXV00WOsHFOazOI/ElJ0dXZ78vuUd5RiVuqJtITTfDZUIq1oxcX9JpRP59XQHPzyPVAC0RShA1vKdCZ6PFkqKlN+7rGpjmIG3+7Z8WU82ekYC2Vzrirc9qo20+gQ34/NivYDJJOTewZ0eI0exIxwHhMt4jng8vAUBXJAecphtKvK4pr702OyfDrs13j66fY0T6kEApUbo8On0fAQOdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=szzB/iuNilEoeqYwxVAbpR8i+A7hRvbWfrze6NET4kE=;
 b=O+aJgOeshbbpldzNK/dKdQmvwD8KGZSxeTw+4x7bRwoq2/ozrut2QSxF1scveM0RfYmJlqo05O0sWinkB7I1DuU9mVWhrqg/gAdvVCjh/+lYX9FiGtyMFZmhWa2AYCRCQsWxsTBhOIdO6wuwJw9/Ym5qZFsLDIOlHFzDMqX0AmUguxxOgU2lAL/kdH2N4wqO1muCZO+QdpZZdVSOhEH+WNF6lRu23MQpz7E4h2jXvKAKa8Xk6MUORJ0k2Su1vyOaFiQ6d7vgwzA4rcUT1+0b+XwdC/gxAAvBxH4hFrLb2RNyRuSTqqEawm01gW1YEijTh4ppyCp7a01FLvcMU02cOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=szzB/iuNilEoeqYwxVAbpR8i+A7hRvbWfrze6NET4kE=;
 b=f9TkWQgN+/IEy2wtFinl2E/SjXJ1nxpwxnXTS+CAXIVRB2zElAbgZaRSHaGxzzWBKy0zBXSHaFF5LJWZ2+CCiWBHw/U0swTI/FXsCQc+HsXR0GjlvKsIvx5HOKEVzvALoUclIDlLyoT+O0ldCmWnRK0xVbCHLlq7YDO+sPzi2mE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM7PR04MB7064.eurprd04.prod.outlook.com (2603:10a6:20b:118::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 12:42:05 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 12:42:05 +0000
Message-ID: <ccd6c80e-e3e9-45b0-a842-4ce7a35d2f28@cherry.de>
Date: Tue, 8 Apr 2025 14:42:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] manuals: remove repeated word
To: algonell@gmail.com, docs@lists.yoctoproject.org
References: <20250408113128.12973-1-algonell@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250408113128.12973-1-algonell@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0146.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::10) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM7PR04MB7064:EE_
X-MS-Office365-Filtering-Correlation-Id: 2994a6cd-e371-499a-e6a9-08dd769ac47e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NnljRFFNMjdMeHdpd1dVTmZ2bnBXSktsTkg3SzlCaXdhaTNqM05VbHpXRUxT?=
 =?utf-8?B?UW1qMkNlbFFNK2E2cXRBYk1SbWtGQmhZanJ5R3RHZWlzWXNVV1pyVllhSDE0?=
 =?utf-8?B?NE5XVURNb3l6Y0NzZ2RPZWZyVHJGbzFXbmlNbnZBM2hJSXhhNWlkT3BvbmNt?=
 =?utf-8?B?dXI0TURISm5hdFZOeGNWM0RCbnpEQm9DOTM2ZDdCcFdjeDloQytTbFdlSVp2?=
 =?utf-8?B?N2ZrT3RGUzVpaGtkQkdtcTR6cmJuZm9qSkRxbE56M0ZWRUUzVU8ydjhvTlRP?=
 =?utf-8?B?ejdNcjdrOENLRFdLa09HWnFVcVdOOXVuVDQxRUM2eFZ6Ylg2Q3pvYk1iUmdz?=
 =?utf-8?B?Q1lsd2wwOW9EU3c0bFk3UjZDWHRabThCbXNMbmJBdDAxc1k1NkkwQkpMa0Fq?=
 =?utf-8?B?OFB1eEJZRXV5eWlpQUNkem84NE4ydHcyUGpyMGc0L045TDZtR3VibHZkZzVD?=
 =?utf-8?B?aU9KZGRNbk9hRVdFRkgrNkp0NXhiRXd3RG9jaWxVakZHVkhxdXRZRkVXdWU0?=
 =?utf-8?B?bExJYTQ4QWEra3ZTdFd3Wi9GY1hPdDd0NnRuTVRGdW81MlcvOWxDV3ZQT2hh?=
 =?utf-8?B?MllQNUNNdGc1ZGk1SkpSdU5tVk5reU12TjE1VDFxeUxjdmhiT25FZGErR05t?=
 =?utf-8?B?aS9TV25uUUVVOHhuZUowQklhaFJsUy9BQjVKUEIwM2FCaUUyakcxK0VJdkdl?=
 =?utf-8?B?RXpSeVR3a1J2VXFVRjBkVUZldzd0ZEdFc3d5bUcxdkJnRTJxd2FqdlIzRUJi?=
 =?utf-8?B?MFIyRmF3aTIweEVvb0JPTDd5dEpYTy83elpUZTg0bFgxdXZTSkNxajRZOXBW?=
 =?utf-8?B?WU1ObGhlYWJmam5Kemx4eUJFSjRtb0xuVURGZTk4ZGV4V2xlWERYdGRsSVUx?=
 =?utf-8?B?L2xJempOY2ZBdnliSFgxZ09JOTMrdDY4R3pyVzJ0TWtLZXFQSzJqN096N0p5?=
 =?utf-8?B?RGl3K1M5Q0k1MDVDcVdRZHRjQUdvMUEvcnI3SnRxcm52UHVOS3c4SkVBdi81?=
 =?utf-8?B?YkhrRVdBeEg0eElkbGVsNi8wbURyY3pCU1l3NW9mS1Q3ekFqeFQzRFQ4b3Vm?=
 =?utf-8?B?czl4MURNR3RLZkdwMkxXSnhyNUlZSENGL2o1emo1SlRsS2l6c0F1dVBWYU9s?=
 =?utf-8?B?TE0vOGNJd1lJR3Fqb0NyeDlSU1lNRC81Z05peFRwYUwzTmhyVnFSUkZYRW1q?=
 =?utf-8?B?MDNzMDIzN28zKzRDaTBTMWlMa05GUVhiYm5tTmRmdEYrQnk4VHdoWTRZbGo3?=
 =?utf-8?B?TEc3Vjh4NFhJNFhTVVFKODNCRGJ5ZzVqWXJjdDVGN1lWcVNBeTd6QkRKdnpz?=
 =?utf-8?B?TlhyYTNKK2p1bno2Z082VWRpdVlDam1yWkc0TmNDUlRwWDRxeDVOV3BkSDRB?=
 =?utf-8?B?cHVoU0Uxb0kyLy9HRHNUTXZTNzlCdlg1dUNiV1kzTUttZXNUaE5CRkdWSEVW?=
 =?utf-8?B?WUFzN3FFWUpZaC8xbnlqcmc4Zml1azVBSDUvN3JvQUU4RzY2REtPb2c1bU92?=
 =?utf-8?B?Umt2eC9VZENUcU5VTXcvQVVYMlJKNXc2OEtTbkJOeUNwQm1yM3VBdFE1N3Bj?=
 =?utf-8?B?UkpCR2o2WlNwVmNsdnI5TFUvalBRMGoxS0gwMWxWVjRtUVkwMTh2NVJWU0sx?=
 =?utf-8?B?U0pDNS83UzFPVXE1Z01oUG9xTE9xakJNUFY5aGFRRVlDZGE4OXNSYlUyc3lQ?=
 =?utf-8?B?SWpJekVlOHZmSDVVOUFTUllQblYzcEdsYldadU5uZUlaQ2x6WGFRV0Joeng2?=
 =?utf-8?B?Rm1vYWF5bnd1ZlVKSU9OdjJHV3FOL3RQUU9rSVBUaXo0VndwaDJ5dnhVbzRw?=
 =?utf-8?B?Y09lbEZUSGFVYUxXMVc4ZzNqM2FSRVZIQnRSWXNaVzlPMis0NXpIY2Z3WVBp?=
 =?utf-8?Q?l5r6kDOljHKPr?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TkJNeUV1eWpxMUhMUE8yL3RRRnRnYitEcHJkbHIvcGZTTjNtRlpVKzJHK0FD?=
 =?utf-8?B?dU1OaVlmV1ZxNktBelpjbi8xendsQ3BVYmNrZXZMSlFVaHFPMXY1d0NLeWQ1?=
 =?utf-8?B?clVuemtpVHpzUDE0MUdFbEZoNTRDaytqSGtLaHhSa01zOFdvOHBubUV1bFNa?=
 =?utf-8?B?c0VBOGY4UmEyVTloTUY2UjFFd2l0Qkd3R2JhWlN6YVAvUmYvWStKY2haY1RD?=
 =?utf-8?B?cTFlVkozRE1DamdmdDNCRmxLUVNOcnRmTC9YSGVUa2F2ZHZWd3Y5VHV0NlVX?=
 =?utf-8?B?TzZVdXdodlkyUUlYT2RoZVNXVWlEVUwvaU1RL2ZNcFZvVHMxZlVhNW1BL0hj?=
 =?utf-8?B?UFVjMlY1bk1sa3lqZGdhOW1DZUJSamQ1NjQ0MzZFWE1NcFJ2SGhRaVk2SGtM?=
 =?utf-8?B?ZUdURmRzallPN2s2ZTF6aUpCQU9TRlNvMFp5bTJtODhWYnR1ZlliSmlBUWJ5?=
 =?utf-8?B?Zi9aS1NKUlVka2FiOTZwZHYwY3lUQ0tQbjFHc09peHFWMFhDQlZnQ09YZHdC?=
 =?utf-8?B?NlliQW5tN1RMRnVjMjFxLzNCYWk2SERrclcrYXVJVVJ1cUlDV2xCR0FidVd3?=
 =?utf-8?B?Vjk0QjhNbUFWQXVkNVRFUlFlaUNRQXNUWU5vaVBhU2p3enFOeTlMU3lrYkpR?=
 =?utf-8?B?KytCTnhyV2t0SzVxRlBqVUxuSk5VbHJZTjZuQ3dVYUlWdDM3RlFnZkYwdjBM?=
 =?utf-8?B?dTNLdnFYZS82OHVtcVU5U0RzSUN0WGpSbXo1bjBySm9VemkyaGsweFVPWWlV?=
 =?utf-8?B?cHd0cHZpZ2xPTnl1c0NHVERERXBIMTZuVWFwM29ES1BndG5GcDdCcFJkMkR6?=
 =?utf-8?B?eDc1dEt2TVQ1Z0NBZXlPZnBOemMyemdvYXFRRy9KR0VveHFOU3FuOU01aVJW?=
 =?utf-8?B?K296cTJ1OENSd3hHSjU2eVlKNlBtKzZNRVA5dmpENEpXdGV4eWhoMWxSRFA3?=
 =?utf-8?B?allrUGU4YTdLVWE1SVJKSW1YS0VIN09uNTJwNzJOMVVkd3kzQzBNaXZtc1NF?=
 =?utf-8?B?eXZQTnlsK1BhcDdMK0JlYnFmQkZoSlpIQnF4RWtxalN0d1NMYmhTWTZLRlZ3?=
 =?utf-8?B?SWs4bDdySk54MldGdUlNcWpIYUNlb2JkZGNDVEVhUUExTWE5QUhDaXUvWHNI?=
 =?utf-8?B?RS82dU1kdW5tOVFoVGRPeURCVTZQQ3pNZ3FyWlZodGZFMzhYZE93YXFBT1du?=
 =?utf-8?B?ellIUDB5Vm9uZ0xKMDVvVkJlRXU2Y1o0WG5oTWd4L25VQ2l3Zzc3Y09DbTZX?=
 =?utf-8?B?bVlkT3FTZi9LbkJ4dEhQenZSUm5ScXBpaXRGOU9HaTBtY08xR25na0lDeksx?=
 =?utf-8?B?LzJQcFdTQVh4R0NjZFBaeTI2ZEtQbFcvRmp0R09kbldVWGtBWXhBVlVBRDJ6?=
 =?utf-8?B?YW9ZK2hmYk9pNU1Ca0x2WGlhWUR6TE02aGEzZVNUeGE0QW9ub3NucEFiSUZY?=
 =?utf-8?B?dy81TU16ZHNPMUd2Z1hPb1RSbUlMWUR4ZXRYeUE4anhPVTI5NmhXQkxvdTVa?=
 =?utf-8?B?WlRkT1M1OTY5bWVBM2JsanJTVm9td09UajcwNVUwNHZab1R0N21vc0ZRWi8w?=
 =?utf-8?B?UTdXRGE1aFJra2FTWG9kbml4ekxDdzNkZmtNa0gzT3c1TGVINzdmMEhaQUZl?=
 =?utf-8?B?NFlvNDJjeWkvTkpWUGhjSlF2MThGdjJrNkYzNjhockl2Njg3cEZGME9tZzMz?=
 =?utf-8?B?NlV0WmZKN2dQZDE1ZE85b0tsQW5nSGdlNGo5L0RuWXRVVDlvYXBXQ2J6R3ly?=
 =?utf-8?B?cUJWQlR3a3RyL0Nadm9Cc3F3T1o0RTBTSVVnOXovU2VGeTRYYjlEaVFkQllz?=
 =?utf-8?B?bnBnQlVCM0s3bi9vYXJZZlZiYXlUZkhHa0NCY1BCbWRJRnZyUTdaU1BHTEgr?=
 =?utf-8?B?WVl1aDlHT1YvT29kWE1qZHdyZy9pV1NJZjFqa0V4R0FwZ2R3WTdzZ3k2enVz?=
 =?utf-8?B?c0V3TjNRUEplZUE5Q2JjTkpnMFBTQTNuQWJDdUdyUk40aHhXTUFlUWM2ZThs?=
 =?utf-8?B?Y1lXS01kS09VTGtLcnRlMVRzazM3SmVYS3pLR0xiNUE5NGF3dTYxdTR0YlNn?=
 =?utf-8?B?ZjEwYWdnVlNIQ2l3aUZrRmU4WWdlajI0WFE4UDF5S244TGxQbHU5S3JQSTNj?=
 =?utf-8?B?ZkVwWFNPZ2dwTjVFQXFPNG1xNWF6MkNzL2Z4YkZrc2t2UnZHUk5ac3llNVhh?=
 =?utf-8?B?L0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2994a6cd-e371-499a-e6a9-08dd769ac47e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 12:42:05.2423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h/U0Nd7ggDrOB6fg6ioU/yVheRsy7AwxFPqcKprHV1ZmzjkK5DkkK5qSut9Vm6S/wDQHHRORZPj/PjRWBc5IG6YjkcR6s+oW53JMzdUcYB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7064
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 08 Apr 2025 12:42:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6717

Hi Andrew,

On 4/8/25 1:31 PM, Andrew Kreimer via lists.yoctoproject.org wrote:
> [You don't often get email from algonell=gmail.com@lists.yoctoproject.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> The word "modern" appears twice, remove the extra one.
> 

It's because it's VERY modern, like modern among the modern ones.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

