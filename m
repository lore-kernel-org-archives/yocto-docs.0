Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07396C433FE
	for <webhook@archiver.kernel.org>; Thu, 20 Oct 2022 08:06:05 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.59])
 by mx.groups.io with SMTP id smtpd.web08.7099.1666253161989964314
 for <docs@lists.yoctoproject.org>;
 Thu, 20 Oct 2022 01:06:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=d34paw26;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.13.59, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3WUlXokj0ljz0e6/Q4WDfWOyY9/CGcJwcp6Ks9zNkSC2w2lznKcC6UpjB5sgLVviFRpzlKg66miUqgoh4F4kmiNkLccukURnhLUQ6+94yvxtQjyiI6bFCrWImu9crxlc6FZdMlYeO+4d7/iNz8FT9YD4ZBcRFYsXBYATW/U/11Xlho7MgQt5ra02I0S7WPxp+Wx7wyhyMnFWjO5jtu3VtgbF86nxVDcEQAtKTD7KMHkwd3YJVnE2Gckmf42MRTWrBgcThHyK6fY2E5Vf5sjQWT4NShz1ff0yLO+o67lsVBXNpMK9UVK3i891uruTleV+ciJZLai2/YLTl+J68lsQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=seHeYnuRQBGjEYX/fp/apxpxK2EyFQnHLrf+Eq3eRLY=;
 b=CBpIGt7xc2iMMirctKJCPhK30XfDBXGpln9rbdi2TBCzUj+rmQVUlQmxPBpZaRVh5BpxzaLwwfSfKDZUVqT1opKgh4T8D1OjuU2sUTh0DSGyn6RiwRmUZ27U4r2sbPP8S2mvjdr7gSBqQbTPyGVGozKvxc4kgRKvX5HYXz1pXMkX4JpE45zPMfdtyLU40E93MLYB1MWDUJCyqBZ/jlDnultC9ImeySpbnED+PQsq9uKVJnsxyItQK194Pe6lHhKgYrepEXLDXR1NPdPgxe0lUiUdZ0gSkXWnqE+L2grjK90LX3qZEALeRezs4fPIJowT1rlvtp5m/ISPdfh0SfcKFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=seHeYnuRQBGjEYX/fp/apxpxK2EyFQnHLrf+Eq3eRLY=;
 b=d34paw26ZZUxHAUEPG+1wvqCqtgceaKp9dKvTEEZ/GLEmsyZSphbyNQx73wlx7ZJ7QWbqlduOAoE0ESJF9RtC4XZZ4l5psPKhman5b+z2KBqXaqla4AKl9Itjlfx40U8ZcbyZN79wilNy9Se8mrFPkUPdBFkqP3CPra5VF4hFzHV5DGkS1BljaJ9EXSreNl6dditByur1SdI+WQOv4LEiBQlioRrRUpObsD3ADGvEMzDGPWkN7fTt8SyhxbaIzVfaZ45SGQxiY9BCv1+lfLBOgb6wkPyGBD7VWvMPyHlmlQlOrEnRYVvNGyJRPm+M0Krzf0KRa5u7Di8A16v58FMLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AM9PR04MB8745.eurprd04.prod.outlook.com (2603:10a6:20b:43e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.28; Thu, 20 Oct
 2022 08:05:57 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5723.034; Thu, 20 Oct 2022
 08:05:57 +0000
Message-ID: <3ada993a-dc8c-47a4-f5de-2a4650a684d5@theobroma-systems.com>
Date: Thu, 20 Oct 2022 10:05:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [docs] [PATCH] manuals: fix misc typos
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20221019124351.44462-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20221019124351.44462-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::20) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AM9PR04MB8745:EE_
X-MS-Office365-Filtering-Correlation-Id: b30c9891-368b-4886-49aa-08dab271eb3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dZHx6SpuL0EIL70gEBYimisyJtP67gVpV4mM0n/kBAx4WcqFQl0EZ9vBoj46nUf2eauX9d0t8FL1Bg2oihdLxljVioWuTBKX+gePCb8JgBHqk+rQaBW4MfgJ0RoNLtFbco03B9oc+S74DZJxECq1ErQ9WHHkeiD7aGTWDt8DLl6THRd6tBJUmYm57426JDJZ8MHJZaT6oHD0+oo+UigZZ4ShsllC6uKUBcekKqfjd53pV+X2qtlgahpzJtLPM2N8owg0RDAi6uyKR7tlfyLpz1sDoaKyTb9DwObvawfktxVRDLAujQ2Ci1GxqmBI5xKbAcusHINCRiVchoTZMLXrTyZL8LcK1wjxSSmRCOz7ERq3IvvS4FHMbGNVHW0imjSsECx9lb+blWwAe2uIeWQXje2lUGegGBNoFZIANwH7OxyBGAGRlcXwZzkKBbv1KMe43D/hN4+bx/zAlpQqKAbe/m6yi/Q0iuUeLo/pR0irVqKV76IGsCzHHYUBtiYiClOZuD4IYdPH33Gs1HF9iZiF6a5RYYTXLO4Uw3mbZTlnOy//aNA2ef2VUoDBtwfEQXHhKr593btAiSQHAbyG49HvYAn4fpqIfsWLHOvmloGP8HwccMUSTO4BWNL/evmDValCFd3xSP8f1EwofLNOi6PZ0x3tzYBKSCh55tVSMOOT30gzzYMvhvAHWI+rI/R4A0rmIbr9+dvmY2jVWfZEqWjoh1TejP7IkKS0xTw99Ce5XwHPHY7/aJ8+eYAK4PmOWcjB5dyhAf1XtpPKZ+R7oq0Gp5GrliefePdY9mptQixnbO0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(396003)(39850400004)(376002)(366004)(346002)(451199015)(558084003)(186003)(2906002)(38100700002)(2616005)(6486002)(478600001)(66556008)(8676002)(86362001)(66476007)(66946007)(44832011)(8936002)(31686004)(6512007)(36756003)(6506007)(53546011)(26005)(31696002)(41300700001)(316002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N0ZKeTJYZ3Q0TWlaVEtZNWdBQ2Z6QlFVdlpybExCdVJ2VDhLbk1TaExJbGhj?=
 =?utf-8?B?YWpTeG9reTh1MStOckc0NE1BTjgxQzVkODEzSFFwczBmUjFQb3YxaG0zRXY2?=
 =?utf-8?B?WGcwRktsOS9RMCtKOEIrVEJXQXgzNlE0YmxqWVpWMWFtMEJQYmdMaDRlT1g5?=
 =?utf-8?B?b2ZJY3JWVWhQZElObGZSdlAxTWpaYllMVVRjbGg4L3Y2Z29zZ0luWkJ6VjNW?=
 =?utf-8?B?bmFYdGlDYUp1elkydnd3b29kbURaNkhDTWVQcW95M2ZqS0phNFdPelFDandL?=
 =?utf-8?B?bXNiWWZPMHVob1hrczdWdDI4KzRnbXVKcDRLcmJueFZ3R09idnN6alRlOEhF?=
 =?utf-8?B?aUpzalFqS1pwdFRxYnpkRzdTWEdLU0V1R1VCMXd2Y1pxcHU0Y0haakNUZ0VQ?=
 =?utf-8?B?dnB0TDBac0RndUNhLzZ6aGlycEUxdlZ1ZWhZSlZXRmJmWWhFVFJFTnVtRjBR?=
 =?utf-8?B?azQxRkpwKzJKeS9ERy9QVjZhUG9VcVNoNVJVTVY0ZXZ2TmUxaWRQc1g3K0o3?=
 =?utf-8?B?dnk3a3JuSGhnWVY5OFRhOExRUk1PUEY5dUFTWnpSSnhlbGRXTW4zRUMrV25O?=
 =?utf-8?B?VEVnRjRIRncrbUFVQzRtSjI1bnhJK25UQk9meFFPdC9EQXQ3bXNkc3poclV1?=
 =?utf-8?B?VDJhRmpkOFZYZWVJdkRXMDIvTmUzRktQek9rdWtqa254bWQwckNveWttYk5y?=
 =?utf-8?B?TnJTa2dKREFkZUFVVnAzTGFjdUtGS1k5Qlp6NllVL241SitOV2wvR3VVaWtw?=
 =?utf-8?B?UjZ5QlpzNEk4QUtkVFNWYllHSVV2R2xEZnNzbHFoRXBoRW9VQXBsSUhHTGFU?=
 =?utf-8?B?MDdZdjdUL0J2N05uZUQxMEFlTnNiU2FRdDJ5T0J5VENxVlV4QTk1dmRGZUhm?=
 =?utf-8?B?RmNqZ1JiQzVJTzZjbm5lVlN4QXVubkJTM1RENWJFQlM2TjhTeE1yd3RqUUJO?=
 =?utf-8?B?cHNzakxoREV0Z1RUMTUvNGp4RktHb2ZCSVlRRDZnRkI3RzRqNUFwZmZReXBM?=
 =?utf-8?B?Q082YXNGSVg2Yi8zVDFETnJ4eHN5S2hZeGxaVDZrNXVlUXhydGxzTjREUHI1?=
 =?utf-8?B?bFlXWXpaeHRmOER5U21WaDl5MGRpUHcwSHNrRUlWQkdEdDNOeVpuWklyNnAx?=
 =?utf-8?B?SmczQ1IwTzJKK1dVSHBqcTNtZm00T0xUU3VtQlpjNTNMNWpKU08zNEdZeFBn?=
 =?utf-8?B?MUZkNWhLMVIyYU5maDdUY0VMODFVV3JFaHpmb1RDcW92Z2RGWC82TmtraGtM?=
 =?utf-8?B?OW56UWlXemZxY2MzVkNJbFY5YWgyTU9zTWNHUC80MGFYT3Foc0ZVOXVndFJX?=
 =?utf-8?B?NFFHQ29WZVJQcHIvWDVQMDFSRVU3dE44aCtEY2EyWHlrbDlsWXNNd24vWUp3?=
 =?utf-8?B?bE8vdjAxT1ZHamFWeDRpKy9oOXhWNk5ueGxObWswZ1JDbVM4L1hHQzRERTQw?=
 =?utf-8?B?b0lFV1c0SE1EL2g1RUdNbE9tZDBwMUJRSUQ3c0FKYzhPU1I4ZWI5eXRNVHhT?=
 =?utf-8?B?aXZ6WTlwejJJSzhySmR5ZHM2OWMyTTZqS3A5azFkczdQaEpZb3hrMGRGQldp?=
 =?utf-8?B?V3VDMGNZU0pMQVZjOGZIMkk2ZUY4TGt4TlFJb0pQTDJ1K0lBaUJQeHhjbFMy?=
 =?utf-8?B?VzhIOWdhcWMwZDZFRG1ZeEFsc210elQwd3I2ZzFZdmQ4V2wrSEFjd3Zyazh2?=
 =?utf-8?B?dWFCckh2VmxscjMrbHM4VXpiMXhwMFBobHY3VVhvOVhzeXRnVk1WT0phQ1Fh?=
 =?utf-8?B?cWhqemZIbkZwaEtpQlY4ZURCWGdBRWVqOXMyUHZ6K1NaS29nV2c3Vk53cDRs?=
 =?utf-8?B?UkVtYlp1OVdJTk5oZEN6Wk9la2kwS3dKajZoanEvYzYwc2p1SWNhWHZFWkZP?=
 =?utf-8?B?N0FIMVgvMTVYZWU5ZWJob1FNdTh0cmxmRlQ4K3pYWHlSNjJ0dGhydmVQbWFj?=
 =?utf-8?B?c2E4WmdpWkU3UTFkd2FpTmY1UzhSajVlVmNybUtTV2RhTVIxUHh2K0djOTQy?=
 =?utf-8?B?T0huZ3lwaHZlYk9lbXdDbVFxV1I1UThWbnRSSy9kR2NXb2tCbXl2dlpTS3BY?=
 =?utf-8?B?Y3M0SFRwWFoxQzBxbXUrTnpSN1hOMXovditCUFdYcXhhMmZabEwvd1lPWDlw?=
 =?utf-8?B?ckpROVY5MnN0R0VzaVRRYXBDbXpFNm1NS1JtSE1JY0xBU1g2VHNoS0RvUVlu?=
 =?utf-8?Q?BhpNa+HLXE/v7CbXTE1UuH4=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b30c9891-368b-4886-49aa-08dab271eb3d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 08:05:57.7494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nyPhe0lQ2s/LdYfCYBQZ6EifUrqvzoZKWN8SxAmAZV8MoUzPorVsMwbRLWZw4OYs2fZEo6NQ4TH0rlDIOPxF565X56TSHGuLzRE+Vs69QJtLj5v3C7bDHLsgbU3YlrqC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8745
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 20 Oct 2022 08:06:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3391

Hi Michael,

On 10/19/22 14:43, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>

Cheers,
Quentin

