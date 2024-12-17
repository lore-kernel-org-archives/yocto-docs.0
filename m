Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0164E7717F
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 14:09:08 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.43])
 by mx.groups.io with SMTP id smtpd.web10.82228.1734444542241856189
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 06:09:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=BP1koz3i;
 spf=pass (domain: cherry.de, ip: 40.107.22.43, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E0itbK4ZE3EDqtzNK3ewEetgpYwcU6xAAFUELAr14pIMV2Fc5R7ALEkhuYSk+RNEMzEBlGPS/5e/TuSCWeUuygNjsfJw0Li+EQ9crluAt3tfsx/LNW3tUwtIN3FBCfHoWeHXAmVpmyQ+WHC5B8paktdrdAeK5XphFL6PxHiYhCVWXqX/SPTCrspD3UnCuty9a6QLZF/geifCU2Qa0AVz/6XonORW0O6U02IyPRSFfERBNH7HZDi2xk37TJ7EsOciwO+kDgoRsOk9sY7FDRzaypwzVm/a27vLaSPfWOUyCz/jsmL4c1+DDFDiWrMJCtBPLYmYteZvUqEqZrLQAxgztg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tlolv2LL/J4VQLUUDICB4zYtQG9jqwTaVGpiY5TApmk=;
 b=CMfJVC8M6Pf401xqURfSFZz5yrsegrNLZni21vplBS8kkGXX/JqZ935kKQKWeuJr3xMUS58/c0wKyYZ+oxWuymHWjkVVN2dKBRWogTpFTlXcXTQoyeb3yn5MZb0GK/dwOLKcO2xTVWHtwxq75C8+EfxLan6UWPsglcR2f7QzNT2MfIDNgbl6J2Jor/UMtNt32bJFlqyhkDTH14w9qer2ZCXhQkBPjpXqvgrN0n8PHM4ws+jqYdZw0Wez4a/5rBLY7lLPEJTNoNv61zsCEmc7SYbRTgY5GloPqsiXIJKPv79YSAUMeBnPxdTZWPZfD0IxxTlv6Tw0M2KH91ZkXC2C1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tlolv2LL/J4VQLUUDICB4zYtQG9jqwTaVGpiY5TApmk=;
 b=BP1koz3iRq1dCokfn1Ez+wg5M6jihPPBuCz1c+SBdEQwxvlF8dw3HAKj1UnPi5Y4/Rf6pXuYAbME8dLAG3AC/GSIGPYbI2ZzNQLD3jFt9zGvw9W0uKg/x1TjctaXUDFAMPiTikj1dOxTHy5JlF0lVpeID/+6tOkL1gFct8DFNTY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM9PR04MB8082.eurprd04.prod.outlook.com (2603:10a6:20b:3e8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 14:08:59 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8272.005; Tue, 17 Dec 2024
 14:08:58 +0000
Message-ID: <1a101f50-7b94-4aea-bb28-b00ba0571986@cherry.de>
Date: Tue, 17 Dec 2024 15:08:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs PATCH 09/14] Drop support for
 BB_DANGLINGAPPENDS_WARNONLY
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241217-release-note-5-2-updates-v1-0-b189493b1b09@bootlin.com>
 <20241217-release-note-5-2-updates-v1-9-b189493b1b09@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241217-release-note-5-2-updates-v1-9-b189493b1b09@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM9PR04MB8082:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d4bfba2-4ff3-410a-41db-08dd1ea459c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Si9qMnUvTzZpWnJWaUkzaWFqdEhDTG9YeEh6cVUvcGdxUGRsanU0OTViNmlM?=
 =?utf-8?B?TCsrai9Pb0NteTc4ZFRscjI4ZmlhNnJpQ0twdExJcHU3ZU1qbERsYmxpWFVY?=
 =?utf-8?B?THlSV2ZxbGE4U3V0TW5uNVpNejUwSEduWEkxUHhMUXRzaWdNZXJENC91c0lY?=
 =?utf-8?B?RlJmOVBSVEtGSFlyWlJ3NWNlcFNLTHEzci9mWUNmc21BbmF4akhsSXJwQXZv?=
 =?utf-8?B?Z2U5em5mLy9vQTBCa2x5NWdCTE9vSXVPeDY1QlplU2tSbytCODhYeU9Iazll?=
 =?utf-8?B?SHY1TVEwRVdISXI3MDZpQjIrWUJLaDRJVHZKd1k4TUdEakJOSWlUZ0pyK2Fk?=
 =?utf-8?B?cExIeUFaTWY1ZEtyNllLekRHc29hb0w5ZGNzMHE0MlNaOHRQMlBGTHprc2xu?=
 =?utf-8?B?MEpuZGI1STdPem1sRmZ5R0t4NzlJOEFRU1ptMHZTY29BaUlKUVJqZlo5d09z?=
 =?utf-8?B?ajBpbVQ4QkxIbmpuM3NhOHR2RmdPZ0tMeEZ2UG5NOVZZb0RieGpMYWsxbjRl?=
 =?utf-8?B?VUhEWStTWXR4N2J5S1RzVHEwTmdRRTJNeXA3Mjl0SXRtTnFKUHVmUVlTYkg3?=
 =?utf-8?B?UmZ3eXlkVzNyY1lWcUY5RFlEa001eTZoV0lNWjlzTXBuVUFsSHZzTjE0WHYz?=
 =?utf-8?B?VlA5RnpyZHVVbnJpaW56V0NKemp0Z1REVCtRRjh3bTRzZk56aU02SFUyYkdq?=
 =?utf-8?B?YlRIdWlpNWF0TllsenoxNEFmNlNDai9EVDVYZ3h1S1F2RzRMOTNvL3Q5Y2hW?=
 =?utf-8?B?NEp1TUdaZVE1SE80RFhQZ0tzL2FZekZ1N2hKQ1ZYckdUeFA0UkxnWTk1SFRn?=
 =?utf-8?B?Um1SeGRrcDlVVTVPZ3RNRXhwYmZXR2N6QmVMTXhGRlNCODhQYWFBUUVTckgw?=
 =?utf-8?B?NFE1VStmRlZXajlja1Zobzl3bFBTd1J1cnB4dlRmNXRzRCsydnlBTFdHUTBY?=
 =?utf-8?B?N3NkU1JqbUdDOStBQjRlZm0zZmVOZzNBZGxrdVp3SlJvVGxmZDdTL2NobGxh?=
 =?utf-8?B?aFFHQVlPOEdCZldrQXJUcmZETEhNSERISVNnelh3c25ad1FoMXR5ejNqN2tV?=
 =?utf-8?B?ZGNqK3BDRjFUY2s0dlIrbGo0dVdmOFV2cmRiRXRhc0ZvZ2dBTTZObXQyM2c3?=
 =?utf-8?B?R1VKU1ZMVjRFMGJYeFhENDR1WFpSRGNjSlNkVXhVREZ2ODVJTTEyRVNtWFJM?=
 =?utf-8?B?VFc5c3RTZG1zaUorc1hkN1R0NDMrSm9USVZNSHM4Uzk0MzY5TkVaOU1KajlO?=
 =?utf-8?B?cjZWQnZiREdPK3B3OEZvbEJ3cXhobVhLa1gwSTNmOWdqa1RJdHprVVBNNmdY?=
 =?utf-8?B?Z0VGbUQ0dHdEU0t1QXYxK2VOajdzUnhDSXM1dTc1aEZ6Mmk5WFcwUUIrejda?=
 =?utf-8?B?NERJMnhLVHdSNk1LRFZuaXhjY0V2eXVuSGlqaGRPQXgxaTVNalNIYml0MVFv?=
 =?utf-8?B?SjIzdDBvK2xjZXhKb3lQQy9vVHFVSGlZdGdnNjlXUUVpR2l1VSszMXpWdVk0?=
 =?utf-8?B?QlUxUENwbVRYd3ZEODZUNDVvOG9LQWJnbC9ETnNXOFJTN3F3d1lLVDljaHZ6?=
 =?utf-8?B?dVB5c1lpd3JLdXBQRit3NFpMM2F0czBKRXgyWkhCeXdhMlZCakR3MmNnQmxN?=
 =?utf-8?B?TUdqMHhMR000U1FaT1hLWnJVZnBxeVBoWUxHMC9aYmFzSFJYa2pRZmpaUmhO?=
 =?utf-8?B?YlkzZzVxT1pUT3dGWWxuWlRUdDZ0ZlZ3QS9oeC9XYnpKcHMwanUzbWszNE9B?=
 =?utf-8?B?SlZicTI3WEJVTEU0ZDlkUTl4QlZ6Rit4VEhaRE43WFlKenBMUWEvOUg3eHZ5?=
 =?utf-8?B?cWJrQUo1OU5Cb0g5QWRZejNrb2VXNC9Vc2Y4UXFlUFozL3JvYzE2NnJKRERs?=
 =?utf-8?Q?cZxjmz6ghPWdC?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Qk9mczFxUXR4WlFmeFRJaHY1T1o0a0NGWkR1SDRoS3g3dHdreE01M1FNWXVw?=
 =?utf-8?B?enp6MHJSamtFa1ZRK2szejR4OTd5NmFuazg2SEVwR0s4ZkdMUVdsR1ZzNjg1?=
 =?utf-8?B?L2lGeEI5dGZDaVduV2d4VWp6SVlwTmhQLyt5azduaGRIN0NNWmpjVWp6Rm5F?=
 =?utf-8?B?M1N6QTBBTEh4WWlVbEFPc3E1ekxtQWI4NnU1SkJwRmJoc3NvM1MzYkN1ODI2?=
 =?utf-8?B?S0hMUWFPOUZUWEUyOEVZbHBYVTYxUkR1dlpSRTFmT2ErNDg0bm9pT0tTTHYz?=
 =?utf-8?B?QVVrdDhBRUdObnk0WU9hazN1SUtwdkJpWEtLV0QvUi9vRGdPNGc0RUJBYmtq?=
 =?utf-8?B?OWcyRGNXeTV5dGM4OXliRXg1ZVFaVVRSbG9mbG9XakVVZDB0L1l5N1IzM0xm?=
 =?utf-8?B?U0xEVEtIZ1JaODlSRmxUdEpyMUhQOHpYdUFKd244ZDRYQzZxSjNvVVFMdlkz?=
 =?utf-8?B?bDVHcDg2NFJaejJ3MTFqK3FQa2w1bmp3WnJyaFBXQno4YUMxNGFyZnI3VW5M?=
 =?utf-8?B?RVU1N1lpeE9acnhlUUNNSHlVR1R2MGxQb3V0aGJnK2xPQkhRK2MyN25SbWtJ?=
 =?utf-8?B?SjlFdWFzQ0M2U1lNS1kyMEVEbkdWd1pLV0lOaUM2N1VtVmpxc1lQMkdGL1d6?=
 =?utf-8?B?WGthR2pEL2pyOHlNaWluakdxVW1NbkZYZ3RmemdqRXVBbFBOa3k4a2Uzb0xZ?=
 =?utf-8?B?VklydElJU0tLa0VMN1BVK0hWbHFLaFFGNHpXRjZRRHdUbXQzWXcva29JbWV4?=
 =?utf-8?B?SG84cll3VVcvMmorS09QREU1RzJ5YTdBcDBPUHFySklRRmxZZHU4N0pCczFW?=
 =?utf-8?B?b0diQ2tQWTc4VGN5UVJCZFhCRVEzSWNCQSszV295VUlzdkxKTUZ5SjMvNHZq?=
 =?utf-8?B?K0R2THlaaHhyVnNvWWRnQWVnem02cDRLVjdsQmdZYzVzckNZRHZzdXdjcHJO?=
 =?utf-8?B?VlVmTVo2Z25wdVNwdGdUTGp4ZENTRkpmcktLTGFTTWlkNmNXN0Y4eWx6MG5J?=
 =?utf-8?B?UWFSKzRzZU0yQkFTWGNSbFViNEh0aGFVUU1yaDFPUXNXc0lhTWR5SUdGbXly?=
 =?utf-8?B?elBUYVJQbmpSbFpaUDBwblJUaXRUZDZwZnY2OTAvRlRjSEh4Kzl2eFVTM3pa?=
 =?utf-8?B?cW44TERxdmdzU012c1lNN24rUnRKYVo3bUFrYUhRQ1MyM0tBMk5XbjBNWGVW?=
 =?utf-8?B?M0M5MFVuNE9DaW9nc0V1OHdNOUFlQ3dBUkg3MVp5dWJPcmQ1OFZObHZpc0xF?=
 =?utf-8?B?aW1lZHlMb2hFa0w3V2gvSENOSVdBMjFjaGFEbVh2WHJUMWRwcW1RZDJCNG94?=
 =?utf-8?B?R3hTSDhGRXlQdkxNSHlhT2dwSTYvREdhNEcwRVRkOFpuU0FLTlBWZTJpdEhj?=
 =?utf-8?B?elBzK3lHQ2FDM1pidS93TlkveGt2SjF5ZDhzd2lHVUJ0SE5qZ3Myc0s1REg3?=
 =?utf-8?B?Unl1Zk44ckhCdWhqeE45WmFSWXZZMFBaSThsZHFsMUp5czdhcUt6MEd5Y0JH?=
 =?utf-8?B?bjMxV3RjcUZSOXgrbGhORVhVcW5iV2JsM2pSdVpOZjhFMjBNcVFsbWxCWXR5?=
 =?utf-8?B?U3E5cUgrajR5RXRWQnphOTFJNW9CazdXMFlEZ0QybWRvQzV4MTlJdWhLWGhL?=
 =?utf-8?B?L1EyaXhYRGxsb1hUdnZVTWVDMURHbWFMS2xRVC9oTGcvK3Vobm9qd1Q3MmlP?=
 =?utf-8?B?U3VNY2tsMlBDSWFaZGFydjF0WjZ6bHl0K2tFdkU2SEo3QmE4bjhlRTF3L0lZ?=
 =?utf-8?B?anFkYzB6RjdlSFFLU21pNk9jWHBYVVVlNHd5bDV0ZEFpazVqU2ZlUVdCZ1JK?=
 =?utf-8?B?R0tFNFZWamt0a0t4WThnbjRkckM4NVY3T3ozSm5INmpDVVRGbGFNdWFjK0tK?=
 =?utf-8?B?REVrR2FBZWNWOEtjZkkvQmIvS3FlMk90bFU1N0VGMHZYTmxlNHhaZlhhOGhY?=
 =?utf-8?B?cHBXZUw4QlFJUXRIdXIwUDlicEZGOSs4eW1UdHNNOFFrWEdEY0lHRUdVRU00?=
 =?utf-8?B?KzlrR0kybVZITmhSRUdRMkZybkJ3VkhDYnRET2YydjBBckEzdk5KQ2c0SmxY?=
 =?utf-8?B?YWw0c2h4STdkYjZXNTF5bVNiYlh6QThTZWwzVnlSTkpMRlp5UldvVkl6RWRT?=
 =?utf-8?B?QnFHYy9KSnhWd3lzRzNkZnhSZ0s2NnE4YmVsbmpvMDVqL2ErTWkzK0RUNThD?=
 =?utf-8?B?SGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d4bfba2-4ff3-410a-41db-08dd1ea459c9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 14:08:58.7543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bOBNgiNJvq4nejoBPErYyPmLfW2hB9xn6LJ7rNRpdF8jiQFcaHDgImDd55c61lMgXRcCim4d3uHHW5I5BYsFoOtq/eGriYDWDJAuzfOhFVo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8082
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Dec 2024 14:09:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5965

Hi Antonin,

On 12/17/24 10:27 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Support for this variable was dropped in BitBake, see commit
> fca9c9e3cb6f8e9f99bf51dc5e8a8d83f4c84c69 ("cooker: Drop support for
> BB_DANGLINGAPPENDS_WARNONLY").
> 
> Drop this variable here as well and rewrite the "Appending Other Layers
> Metadata With Your Layer" section to advise to rename the recipe and
> check if the bbappend is still relevant - otherwise to use BBWARN.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/dev-manual/layers.rst    | 15 ++++++++++-----
>   documentation/ref-manual/variables.rst | 18 ------------------
>   2 files changed, 10 insertions(+), 23 deletions(-)
> 
> diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
> index 89c84669337c9ecdc90110fdf34b7949459a1b9f..365991c225159d051f6dc4122625616b81f01ee3 100644
> --- a/documentation/dev-manual/layers.rst
> +++ b/documentation/dev-manual/layers.rst
> @@ -470,11 +470,16 @@ corresponding recipe file. For example, the append file
>   means the original recipe and append filenames are version
>   number-specific. If the corresponding recipe is renamed to update to a
>   newer version, you must also rename and possibly update the
> -corresponding ``.bbappend`` as well. During the build process, BitBake
> -displays an error on starting if it detects a ``.bbappend`` file that
> -does not have a corresponding recipe with a matching name. See the
> -:term:`BB_DANGLINGAPPENDS_WARNONLY`
> -variable for information on how to handle this error.
> +corresponding ``.bbappend`` as well.
> +
> +During the build process, BitBake displays an error on startup if it detects a
> +``.bbappend`` file that does not have a corresponding recipe with a matching
> +name. To handle these errors, the better practice is to rename the ``.bbappend``

We usually say best practice in the docs (haven't found one occurrence 
of better practice with a naive grep search). Did you mean best practice 
maybe?

> +to match the original recipe version. This also gives you the opportunity to see
> +if the ``.bbappend`` is still relevant for the new version of the recipe.
> +
> +Another method to deal with these errors is to use the variable :term:`BBMASK`,
> +especially in cases where modifying the ``.bbappend`` is not possible.
>   

And another method is to make use of the % character in the filename 
where possible? E.g. for minor updates (I still like my gstreamer 
bbappend example since it continues to happen to me during rebases :) ), 
one could use someapp_3.%.bbappend.

Otherwise looks good to me, should be part of the migration manual I 
believe?

Cheers,
Quentin

