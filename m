Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87769C982EA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:50:28 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4401.1790160627964383299
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Sep 2026 03:50:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=lD1G+4zy;
 spf=pass (domain: cherry.de, ip: 40.107.159.53, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eh1/sIoXOBLAYswF6Y2iTanTRaEvoVpyD3XwWXZ/ZFC/pwvmAiHePdJn0Ijy9f9XDOnueOeOpvbYaBZb+jWB/YQvSnWTYUbOoO4c3Lu/ITOWk9dvMXR7oqruvibFRbH6lzNR1Ki/9OTv5hkN4ORh57hhb5Rtp0pQ2B9/StcalPlEJxmDUOh6jTGC8dTcEjLT56QXnqXiDaEud0Kqf3q1X1zxgA2x7Iu9M+hfVtRqtKhkYiXvfNTS6gUDV1h67kWLUVBsR25yZ6hc4XgS1sA7cGLHnBlqraiekjMibv2sQLvdZLcttD5TWJU+ZE8gRvzleLN6EHhumurFydz0WoCiwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IlIs57VlYGk265C6Qp2tcpkykZHIaEtjyCBfthOMht0=;
 b=rmzqla3vcydIs2JHIRDuQKXIQaAPAA6wJJ94qerboqyMoqvUJoZ/xwJyw0s8QmOCIDktsoDvWdts5KSASDBCy9Ba1TFVjeYTL7FqAPrTwzibKTk1iQIeqNKex4ycuA/R9sjl/EQ+FXacuneriKJS0l7qSRJdW9BUSa94RKPaJ74y/tYGy+jofiCXU8lKRry+MvF1EwKqTBd+vF8TID9aSzjt+I27NbQwewfHPK7aAT6HvlSbaMMsNJqKGlj6wrUp1Fscu83Q6pI8YA4snDGXzcQnQdmEBgdZF0GT/A88IiU6pIq6RdZm50kOcb5z2akqdybquFGbrznFwauAlhZb+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IlIs57VlYGk265C6Qp2tcpkykZHIaEtjyCBfthOMht0=;
 b=lD1G+4zyBboZl92XltH8u+VnaPgIvvcxtWUO/HLgWswk3WTeME9yJTj3dX43emJTS7Xz4B0wrRCm915AT8lSSv2QaIaoAZKCt/DtmeX4nHfp5Y57KsTJDX8eUbOr6mO5KweQL72V1ebApUkx/QVsMQbA92Qd8/uyXfGsK4eN0GA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by AS8PR04MB7926.eurprd04.prod.outlook.com (2603:10a6:20b:2ab::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 10:50:24 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 10:50:24 +0000
Message-ID: <bdbcf879-7eed-4482-ad17-b98fb8165c23@cherry.de>
Date: Wed, 23 Sep 2026 12:50:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 4/8] docs: write an elided passage as a comment
To: twoerner@gmail.com, docs@lists.yoctoproject.org
References: <20260922183249.2433345-1-twoerner@gmail.com>
 <20260922183249.2433345-5-twoerner@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260922183249.2433345-5-twoerner@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0125.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::18) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|AS8PR04MB7926:EE_
X-MS-Office365-Filtering-Correlation-Id: 15c6116c-46e7-4c7b-d2a6-08df19607878
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|11063799006|10067099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: 
	ypfUTatOmFjjHaec93rScrO/Ljl8mYg6pOW1NtON69E0H88uZJO0pU1iyMN2EbVF7dWEbZYXY3DlEx11f0prEYI1wvc6fo9gSzbcLomWLkx9GiVR25bJ4ZsurR0TWvnMmqyqIdbtm0FdUdCHTVjf3sFJwmPJWrdDqKP8hlEXrzW/szFZol8gkI7XiXzUhGYZaWII/FPQeRPlhjvQAagp34pvSl5Boo26bkWdZWnifY2tET8f7QagGmimazr2KeynCrhRB/Ld7YLnFSon2ZmvI93J3IInf6CHus8YVQ2SzyR2jwlNjfdI2vzk9Ryo9Ib6HgEHHkG8B1Yg7AD37+4U0KoLIQqphrmhl2HFwAXuYAmYCLE/7xDvc7ImkmlNyOZ3gs9QDEw+I/74jqGdK+UFq0BOHJEUspEhTm6IjIgK86gT+K1ADw8zsJklr5k0uiyG8Tuw59l+UQKkhIUMW+1oI1Cm9U9EdLUR+m+BpkjEje3+qA/TEkDoaIECTci2mu/skuWD/0+VZ0R5Sp3qvMpB/mu+i/OXhnvxgHuEhBF4xqNQ5AuhnAkJN3LWzYl8gE/zi0YNtd5Pj5UN+DH+dCQYH92Wbximz+83mCwze5fsY2zKy8qTGlysizChpZtsJiYZdsI1lhsTwDS7AnzPXHl/UEHL5q36jKbB2uPd8ZRYIm8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(10067099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d2s1THFBcmVlNkZNRFVsV2J1RTdTRHA1a0h6dWJvSnNTUktQdDVpcVhEemdY?=
 =?utf-8?B?SUVBaXFIc0w0YVRkVndtMGxWaHVNL0tEa0p2QWlaUGZlZEc1bTh1STU0Y01S?=
 =?utf-8?B?UkhzRDNoczlaQTV1RTFySnJBZEZGMGZvV0FqdWNKK0VZZXJiQ1hRWk5CMk9r?=
 =?utf-8?B?aGFKaDhWU09KVGFKdUxGYS9jKzkrOVplWENudXdTRFZkTFcrejQ2REZqb3Y1?=
 =?utf-8?B?Mm11VlRIYW9iZTFvY3k1d1BtM1dKNEhWdGVmV0ROSS9iWG5jdXM4MHdIR1lP?=
 =?utf-8?B?amZWeUJONkp1anlMZTZ6dDVvcWhzVXgxQUdPRlBocFlLc2ExQTNLK1ZxYk1G?=
 =?utf-8?B?eURxWEZVaTBMWGtVOTBiRmc5cVhMM3Z1K3l1TFJCMEFsZVJ1d0dRQiswRDFD?=
 =?utf-8?B?VktXSnNiRHhtbWhtYW1hNFRRY084QXQwSHYyMldlUzJDRG1JNWJXMHlTWTFw?=
 =?utf-8?B?NVNvSWpPUHJEQ3dWaDFoS21vU1VqRTh4ZzFnNWJIQkI0TlB1RnQ1cTdMeEVx?=
 =?utf-8?B?SjlQanNtTjAxTzc0cWpGYk9ENUpwcyt5NGpaZ1JncHF4UENtYVd0Y091NWhn?=
 =?utf-8?B?eU9pSDlwb0ZhQk9VcnQ1eG9lYkRhZmhSRERWMWtxbXR4NkZUQWJaOEdEZW5k?=
 =?utf-8?B?RjhKU3ErTzdlMGo3UDJqbkNLNlBDK2dmR0NydVZDbThwWXdhOFhOWUpQVWdL?=
 =?utf-8?B?T1ZKYTlLcjBvTzgxajE4QmM4ZnVpc2tTdFY1cERjUUdjaHVjdTZraEZRUjg0?=
 =?utf-8?B?Qy9id3R4QzdCVlJhd29Eb1IwMWcyeEdqbUx6R2tSYys5eVpWTldoVENvNWdi?=
 =?utf-8?B?akNxQncyeWw3a0NWVklTNEhLUEZ1MDdESHRIZXNwUEpPeXZXNjNVSGhGRDhw?=
 =?utf-8?B?bnF4REs0bXFOME1aMTM4SUJuM2wxeHg5QkpEU2ZheVdzQ01ZdS9hQWNRMmU1?=
 =?utf-8?B?eFdpamVqcmR4K0t6SHRJN0xoZnlkRWVlL1hScFBkZEJpeVRxUUtBaS9zcmU2?=
 =?utf-8?B?ZzRDbkZSa1AvMzM2UnV0M05LSjgweWxYeFRIQ0FoVWcvTkx3NjNPdnppRU1H?=
 =?utf-8?B?cWVlMldsVU9xZlpCandwcTY2c1RDUktNMlhsVG9nVmR3d1dXelpqVFhrSmNC?=
 =?utf-8?B?SG8zV3dlUWI4eFlOZThrT3lTOERZRlIyZXgxVEdVajNvekdOUjBlNmt6Q00x?=
 =?utf-8?B?T1pYL3hwZU5FOWV0bkhGWDNHVUZaaC9lV1ZyclJua2FOUWNBQzdPNENJc1Ev?=
 =?utf-8?B?UUpENExOK3BpZnVRZFJXS0JaVzVvb1RHZjJzQTdleUxuSk8wNCtVMkhscmR5?=
 =?utf-8?B?TjV3WHlXS0p5eWU5b1NFR042UHJJR09zc0VqZHJGcEIrMG84TXVncHZSTWhH?=
 =?utf-8?B?MUJ6YVMyN3RzcW40UDh1TW9tQUhmS1FHcCthdlZ2cmJFZGtqejhoVUQxSnJr?=
 =?utf-8?B?d2pFQ3RFbE1KUWpPYXdnNHovZFNqazZIWnNkWnk0MW5TV05jOEw2U0licjFK?=
 =?utf-8?B?RXg1cUgvSkNWODVnRTRJbXFEazN6Nyt0T21Wem1NOGtBRzBBdWMzdStPZXd2?=
 =?utf-8?B?R1R2Z05nbWpoYmpjNEdKeHBoYzZkSUNUcW9NTDRQZ05kVVliMG9YL2RhWnNn?=
 =?utf-8?B?MVFabVYvSklYUEhYRmRjZU5rTGpYSE82UGR4QzcwNloyVmtDeldaRnRac1Zw?=
 =?utf-8?B?Q3Y1dmdlUWlFU09CWEphWGRvMVpuZFpwQnl6ZDlPVzhPMXRpeElxNlFjbFhP?=
 =?utf-8?B?cG50YkJMMndxamNEOW5NU1BsNjFNaXpnYy9XVG9nNElvaFZuRFNrVWJXcUZt?=
 =?utf-8?B?RmlHdlkzTVY1YmFYc1VFZzRJT3RWdFZBZHFQSzc3ZmREQ2Yrc0FVMWcrQ2F6?=
 =?utf-8?B?dy9paUZrc2xuSGlEQzQ5Qi83ZThVS3QyNm9iQjNFTjRlRGVqcnhkdWtyK2t1?=
 =?utf-8?B?dG1CbnQyOGRHVjdwSXh1UE9PbFBZMkFMZTdMU3dVdlcvR0RxVmRmdzVlamFL?=
 =?utf-8?B?M2RLNk5vWFp4MGU3N2ZTYldTUGtlN3A3RnQ5UXVpVE5MSTdIMmlmejdLUGxE?=
 =?utf-8?B?cElmanJsZ1NBKzlSVnZwWnZVVVl0U3RlV3lJTWMzTEVWOFJlOWppOExHVlpP?=
 =?utf-8?B?QXlXZlJjWXhIWjRPTEZIRHdDTTZtN2dHdXZ4blUzeExsUDdVN204RlBNaSsw?=
 =?utf-8?B?NGNaRjF0N25WMHJiWlFBR3g2b1JxaHY4RlpzZkN5QURod2tXVk5pRXU4S0s1?=
 =?utf-8?B?WDhBOEEwcHMrMXFzTUhtYk05U0ZoR25SMktEZERNZHBnak1JQUJFV3RJSjhP?=
 =?utf-8?B?WjhYYUxFbmdHZGhTUGtrWUQySVduWVhxcTc3dTBTalJiWlM5NXI1Zz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 15c6116c-46e7-4c7b-d2a6-08df19607878
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 10:50:24.0572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zQ8Pr8AdptVGnZ1OwtoHVlw2dwvFu7z9KmSMAIbZKQ+dGxwnmF8tI19UdB74hB1qvCumaV1LMxtmh0ezFukxA3RjuMAsoBs8ZqwjxBQ7Suk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7926
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 23 Sep 2026 10:50:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10605

Hi Trevor,

On 9/22/26 8:32 PM, Trevor Woerner via lists.yoctoproject.org wrote:
> Several examples stand in for code they leave out with a bare "..." or a
> column of dots on a line of their own. Neither is valid in the language
> around it, so the example cannot say what language it is without also
> saying something false about itself.
> 
> Use a comment instead, in whatever language the example is written in,
> and say in it what was left out. The ellipsis on its own raises a
> question - what is missing here, and does it matter? - that a few words
> can answer at no cost to the reader.
> 
> AI-Generated: codex/claude-opus 5 (xhigh)
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

