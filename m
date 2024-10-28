Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68856D3398E
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 14:27:51 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.54])
 by mx.groups.io with SMTP id smtpd.web11.53035.1730125662509169363
 for <docs@lists.yoctoproject.org>;
 Mon, 28 Oct 2024 07:27:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=K6U1DaFF;
 spf=pass (domain: cherry.de, ip: 40.107.21.54, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yj8gURtuIkuKguRM6VW0Cnk/w0yy87y5eohtm8+2nq5mUO3j4X798tR7l3muZZc9wkRWiBfOceSKPK+8+OsEczYuMg7+atax/wFfGIv3++M/wu48zLTM/uSZTi7xVX1Gwq+Xr/tODCTNREVJLC3TfNz+p72Nh1/31Jopc3ypeoZFA1hF/p/vuTSFiUrWpXmLW5TmAu93sgcxCv4RQnXru/hiVkADzsx/ujGCQdKY5hlOeXInHAkSZ2WQRCGbKHN5VJT/aGkQFUT4zy7jXvmbRlTsw3z3ZUJMEOw1mH5as1WZGuI1tXCJrz92gj7jL44snRkOE4wBHW1wLuN1ZZOoUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyOsO98vosS/pXQcjaRv33CPO/y/JVkk+Z+ZeI/f6Eg=;
 b=YqEMTMvDUpBvPy1yfM5639RsT2M/Wzsao3f5IJceA7NWpvHn57riLsQ6JJ/zASmadFImc4j83YqNm/J2w0JD64g+K5irejX+Fse6WtXzvaISmc25nRsA/oyp6ijjR8xdUgkfNiFvum1LNiMQgdBS798CXkUjum14YgZwdT4E4k+5d/3a1x2xRI/nWMilZs1qDGhrplJN6Im51+ylWZvizEZmPzof3S6I9qS8g2w6/4skxysPcgQyggfp3VW6OXRMB37TmmzhMxKVGcUKCxrElbpv0D+875icJNPJxllytexGsFXeW7nQfKVlWWMOr+nq0eRwCmMejDTXdRJOiUCxDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyOsO98vosS/pXQcjaRv33CPO/y/JVkk+Z+ZeI/f6Eg=;
 b=K6U1DaFFbWLbZRPtPhkwjlOTUdfjpXZG1Rm0vemify0QDXk9Ni6/Ne6/ukjHnfuHO8NIG4ucSUMlWFersnvHEVqt6N3jKCWus5isL/fvhDtc5FPgmtRKs7GL9GO4QSRWAMKBp/ga342sM4evXJ9yXArcKseoy/AGc3IT3S/O45k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM9PR04MB8732.eurprd04.prod.outlook.com (2603:10a6:20b:43f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Mon, 28 Oct
 2024 14:27:38 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8093.025; Mon, 28 Oct 2024
 14:27:38 +0000
Message-ID: <a70748b9-de58-40e1-a033-b6b1e5412a1f@cherry.de>
Date: Mon, 28 Oct 2024 15:27:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Update the devtool quick reference document
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241022-devtool-improvements-v2-0-9d2ebf9c5311@bootlin.com>
 <D57HNKY70WR3.1HM1OVRDY4359@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D57HNKY70WR3.1HM1OVRDY4359@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0434.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::7) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM9PR04MB8732:EE_
X-MS-Office365-Filtering-Correlation-Id: e9a7c5b2-e9c8-45ff-191d-08dcf75caccb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?d1ZUekRBWlJuWUplSjU4V1hqRmRXMWNyV0xPRVhZeUpSQmpzdmNMY212YTMv?=
 =?utf-8?B?U0c2R1hSM29NN09kd3NnRDRWK0IvaFlRdUhiaDY0dE1IMzBaOGdFQ2VGQ0g0?=
 =?utf-8?B?UHN6eGRxSFlsU09oMGwzTmhWS3FUMWRLY09Kbi96b0YzWkhLVWVoUlZ3bm9z?=
 =?utf-8?B?MkQ4TjZ6MkUySzlEOWphMWZJSFFTeDA5QW0vTmMxZ0FneVRrMlVGVVdyM29u?=
 =?utf-8?B?VDVvLzJsUGt1QVRkWmFXK2dibEY1N0dEZkx4Lys0aEtaUzFibzBRektBZ1Fx?=
 =?utf-8?B?L3Q0dGtwUG9OUm5BRzg4T0ZyNUV6bHZOWGRka05Ta1pKWHlhMlk1YUl5a3ZV?=
 =?utf-8?B?TmxlN2JWYU96azlqaS8xNnpmZDdIOFgwOEhUL2tERWRMVjhoRDhhaDRNK2xp?=
 =?utf-8?B?azRJdnNVc29mUVBaOG5IVWFDZ3Z2RitwaEY4dzNtZkc5QThyOHlXMFdoeXJ5?=
 =?utf-8?B?MkxBOXNpR0dlbzFSdUhyUE14b29ieWh5Q2xwSXlTekE0c3d2bUx1RWtVRkJi?=
 =?utf-8?B?SWs2Q3c1NTBrdzFndkJvckdFM2xBbTVnUEkzM1FMYlBnOEw1bHVQSFFEQTZo?=
 =?utf-8?B?YkUvaFB6d1MyUjJGTTVtUDVzdGVQNmY2anVHSlJydlM4eXF0ZXVvT2d5QTBL?=
 =?utf-8?B?Umo5SjZpcFlpTUpQZ3RKYWZjaVhsdGtnWjdwTHdpNktjd0ZLVmZSVlo4NWFi?=
 =?utf-8?B?djlNMFNNSkxkN0RTdVhWNVhqVXdYbWpDZERHTFJvMzViK0FrM0RGYm1HSkVP?=
 =?utf-8?B?OHEzakc0eFkzQWRoMTdqOTY0aHZtdnlsd0VGYVZBd0Vjc0t3Qkk3Yko3UUNu?=
 =?utf-8?B?aEYxSmlvSU5zOG9TMW9YZTdnSndOVTZXWDdzbmxRSE5jaTdGWjhBdVJEdnMr?=
 =?utf-8?B?TEE0bjFjeVgvSnJrYVFjL3ptYncybjh4d2ZQdWxWM3RlUUN0b0VYU0JrL3VE?=
 =?utf-8?B?SGlwcGpCdWZtdk9zN1NOVFlYOEZ6bzJsSWg3aUlzNHlYOUQ3RUo0ZW1WNGt6?=
 =?utf-8?B?RFZyNnFDU004YVhOakxGNmN3YStQT1hoTjhBVlJyMmpxaFA4dWNLVSt4MUNl?=
 =?utf-8?B?WUtYRmJQNEFma1NNRWF0dkh5NW5ZOWNjOEVRTE9OSmRxR1lNL0FETitZZTBC?=
 =?utf-8?B?SUxpNU02OGJheVNYK3RQT2EzMW9PK1NUMElSQkdKazdURDdsRFcwc2hWNElp?=
 =?utf-8?B?TFdNd1psbjAvNkRIZm44Qy9Zb3FEUVMxYUl1ay9sYTYyelM5MnFZR01YcFNU?=
 =?utf-8?B?NVpZdEJPYU9aZkRPUk1JSFlNL2Q0N0Z1N2JRQ2RoNXJZbXJhT2xrZUlINE53?=
 =?utf-8?B?Wm9Rd3RGWlNzYlozdlEyalpEekxhSUJramVFTS82dk1uKzJ3dTE4M1BDOVV0?=
 =?utf-8?B?eEF3c0xjbjhoUTRkcExrZWswUSt1MWZCeUNXeTdBSHJDeW9acTNZS2w5Z3l5?=
 =?utf-8?B?TVVlZ3JWektpRGRKSUxLREJFUmZGd1IxaWtOd0o2Y0hGNEcwSWZOQ1BpVlRt?=
 =?utf-8?B?bko4OWN6ZTVEV0xDNVhFWnBQYmdzcUZtQW5yV3d1aUpOdXFvK2s1TFNiN0NK?=
 =?utf-8?B?TEUrcWpiTG5JdU5xNlprams4OVRpRnc1Z2QyeTNKd1VXcDRoWlRjVmNXY096?=
 =?utf-8?B?R2xpK3NTNzlsZlNSOFRURmYxS0pKYldhTHMvUVVUS2Q1YUFSSzVTK3pvb1l0?=
 =?utf-8?B?L0laUmVxNXNWL3hqQ3VCL2tOM0REcGNQYlF2WGw2ZHE2cVFnTlBiSnV6eGhk?=
 =?utf-8?Q?PNtT93yQ3sus39cIS2UYM1pbG0vSnfEDvAZCIiX?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TFd5ZXo0MGg4N0tzV3ZzdG10Uy9zNFAwNUcvdjR3NzA0NlpGR1gxN1JSbkJL?=
 =?utf-8?B?cndhTEFmZFFYbWp2WHZ3NER3L0R5bCtaSTFnT0g0R0xXZEZtTVdOUUVMWVlv?=
 =?utf-8?B?Ym5WRC9oUGp1N0t0bjQ1b2s1QmNBWjZ3UWJYZ2d1YklScEZrd2xOUnhzZXdU?=
 =?utf-8?B?dFJicHJqaXpxb1Zyc2E4d0lCVDNRMjBiZmtkYWVqQU80YitURjBabjV6ZG5z?=
 =?utf-8?B?dTFQYlh4UnloS05aU2c2YVRXcldzd3JKckFLYWdlTjE0b2xNbVl0VUsvck1a?=
 =?utf-8?B?bUU2NFp4c3p5WmFQZHF5V0hobWVnWTJrZi94bkhiZlV6R3FPWEpzT0w1ZkZE?=
 =?utf-8?B?ZDJKaVd3dXdIalVmVHFNRXAzeG1wdmtKdlUwZWhWQ2twYUJvSVRHUkVndDBJ?=
 =?utf-8?B?bUh1dnFSVnRLOHVLUFVPTFZmSDdrUnZlVFRHSUZtZ2pKamh1dEsyRmVzU0Y3?=
 =?utf-8?B?N2FUaVhORE5jQ3JLdTJQTmlyY01tOWdBaEYrYnpLWnRWbjNVNS9xbkx4VEl5?=
 =?utf-8?B?RStPemo3MUNCZmxCOXNRM1llOC9yQTlhd0NBKzFOUDNRMmtaM2N0azdiNDN5?=
 =?utf-8?B?N04yaG0rNmcxTlZFMnNrRVpzWkZhdHU1d2JNU3plZlFNcnVydldzd0RBVmZZ?=
 =?utf-8?B?YkJmcnFZajBoM3hrbC9pSlJCUDZXSklYbTRzdUlydUpDNHViV1JwM1V2bTlB?=
 =?utf-8?B?UDRPZUoyS3hwdDhkSFNXQU03NkhwKytHdjRNOTR2SmVqVHhuS3Q2ZEwwejVC?=
 =?utf-8?B?RHYxL21KbzlEV09KQlpDNExBcWJJY3JxZkFwUnJRcFJoRG1hd09RRVJMazhI?=
 =?utf-8?B?VWhnVEphSkhlZGloTmxPazJQVW1FTDJBY1A0VEI3U3JlM285dlAzeXJqUUhQ?=
 =?utf-8?B?eU1TY2R0RTkrbS9velhSRkJMTVY2cmdVcFNBc3VNSkdyQ0RucVhpeUN3L2Y2?=
 =?utf-8?B?MkZYelBZcERkSHhGY2ZMZ01DK3pER3NPZXBDWWh2U3kyNW5nYnNoNVdMOTJV?=
 =?utf-8?B?cW9nemFsc2QxQ2R2R252ZG95bS9xWTR4bE1GVmRvOUtiam5PWkZUYUF3bENV?=
 =?utf-8?B?cW5FSGRpQ2RmN2NaY2gvV3dBcTVsQjRvZGp1aGtSRWNBVEZiOGUxVWliSk55?=
 =?utf-8?B?blZ4elpGdU56WUVDZElrL3MxQkhOWjFJWXQxRFE5b1JTQ3dXUXc1RnRyNTZ0?=
 =?utf-8?B?QWhzMlNPak1memt0QlVpbkgvWnlsdGlBRmxHeU5acDNsVWs4VVNXR0V1dFFK?=
 =?utf-8?B?WndiYy9tK2pncnJ5QTBBOGZVam9IbzdtVCsyOCtUOXhLdjdZUFlhTzBqaXVy?=
 =?utf-8?B?ZFRtZHNwZnpMUlJtTzZWOURrdXZ4NG9sMVVkSjF1Nmc4amZVTldjV0VNNmx4?=
 =?utf-8?B?SC9IRzdXdWN4dTFlNnc0c1NWajZrRUpoS3FyUno3UVB5OEMzWUNXU3dueTlw?=
 =?utf-8?B?eG1VS3VvTFVNQk1QYnlxeDFMMXNBVGxMVFFia3NnTVdTYmhSMU1yRVRkV3pv?=
 =?utf-8?B?TEtLTGFSeklvRkhpekh1K1UxVVpqVUwyY2FJRSt1TE1YUVltV0dqQ1U1R1dh?=
 =?utf-8?B?YU1JK092QldvcUtTQzE5anR4Q1FyZFpvZXZnMW5EZ21VVmVSSDRzSUd0eXBy?=
 =?utf-8?B?V0YvMlRHYWg3bVpvNzNRMG42SFBuM3RadDFiV01IT3BUWTdzbm1yRFpmZWNJ?=
 =?utf-8?B?c1k1aWlKcjdjcVk0ODAxaTRrMTl2blZhWFhzbFJsWHpkSlZNUTRQVWtQVSsw?=
 =?utf-8?B?bVhNZ3Vuam1maHhxTy9ZQlJDeGdiR1ROZ1RJcGx6bW0vU1p0OFVxajhHN0Vi?=
 =?utf-8?B?eGZtd1FQQS9jcEUydm9hNXdMeGZub01wQjRjV0s0VzZkT0ZselRVeEFhNXpa?=
 =?utf-8?B?RDExWWpocWJGV2F1Wk5iSVZmMU9TT2hWUGUxVXAxOENaeUFMU3NvaDhuOWsv?=
 =?utf-8?B?b21MYlFna1lsbjVoWndBRlYwckpSWFd1eDI0UzFmUzZGVEZMK3dJWi9QdnRZ?=
 =?utf-8?B?ektKMzlsc25WS1BpdVRtWmxwbVpXVUI3SE9qbXlxWjVZVjNxTTB3UWt1eTdq?=
 =?utf-8?B?RnNQVm05S2hSSDg5Unc4Vk91Vk9sNk12MFBHRU5Pc3ExYlJLdXcwdDdBREhq?=
 =?utf-8?B?d3dKWjhCUG1QUXNUVklqZGxFNklJSnpRSTR6VzlGMWFZQ0NlWHk1S3NDUjJK?=
 =?utf-8?B?Z2c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e9a7c5b2-e9c8-45ff-191d-08dcf75caccb
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 14:27:38.8772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QqOV2th89mqLAaSUD6IO99f4QwQixwIZqj64hhmE/GZtUnTffaWxI8b85RGW8F2Cb7j4RxDCu8W893Ps5euEmO7r72sJ4HTN55BI9aX8Pts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8732
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 28 Oct 2024 14:27:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5604

Hi Antonin,

On 10/28/24 2:54 PM, Antonin Godard wrote:
> Hi Quentin,
> 
> On Tue Oct 22, 2024 at 10:37 AM CEST, Antonin Godard wrote:
>> * Refresh command outputs from `devtool --help` and `devtool add
>>    --help`.
>> * Add some brief details on the subcommands that were previously
>>    undocumented, and the more recent commands that weren't documented
>>    yet.
>> * The remaining subcommands are still present in devtool, so leave them
>>    as-is.
>>
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>> Changes in v2:
>> - configure-help: Give an example of what the command will output for.
>> - ide-sdk: mention that like deploy-target an ssh server must be running
>>    on the target.
>> - Link to v1: https://lore.kernel.org/r/20241017-devtool-improvements-v1-0-2bacc656fe39@bootlin.com
> 
> What do you think of this v2?
> 

Looking good. I'm a bit wary of giving my Reviewed-by on things I've 
never used though.

This looks like valid Sphinx and English to me, so that's how far I can 
go for this review :)

Cheers,
Quentin

