Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5058BC77B7C
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 09:36:37 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.51])
 by mx.groups.io with SMTP id smtpd.web11.4617.1750757787787843021
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 02:36:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Yekb6M5Y;
 spf=pass (domain: cherry.de, ip: 52.101.69.51, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CWMKXRWfoC+ri+miIkIk7ndnEqF4rkbQqwWUaeL4KadsrSTX0CuxbbBz8Vp9W8K+A7sexHkIDD0HdN5cf8yqKX/T5EhuJP6PuRzNkVfWdjNhUBL+HuAsP0Q7pwJqFRHWbj9uF4m8mwARugjRT8sMZ/NKV39eHK+ssnvbSIR3AIZMeNOaci2G30NHybhKKCMvb8F0H7eXffgD901YHZX+zZ4pP2+sNAwq9RdL2CE9Opts6q1XgyxwIvA2875jJECTwegcT5LBeB5CHL6Fflu9u2jRkKRRS1/bHRU77luxjayoJ35GAPmemYNloUkP6XapBFc+J8qZg3WMEeGkHxtM+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4MRZ4+rg6FKl70qfUvZk2qPsBzry/vfKtsOee3j2gr0=;
 b=P/6TP184XWLG45M3c8VuxSiQywJRvlOBX9zEESwV2Lgk6E/6J6TzIaG0H2r+fkc50zVfp76KKGL/KNFgAX9lItE9gFybpaMbCf+rH9/MgXDGp/4U79TE4GAfmUNF9HfHQY5KbCLE65aVyGjw8UzNoplhjvH4/StiiZf+ogZ1VNwOOSuBTecUYrqdDhnUh3HlqAFBC2ukXeQY3zFDehjYkLhMwruyl/9o8N/PAi74twP+BpKWpZBsqOjFB+14faVeQxjQQWYbU2v3t/ZsVX3JVn6JhZA8o8MLoKN9xIFxzQArrUuBYKxBq8mxsfEDc9yGdM9exC3B9tJ3vxbc8zM3Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4MRZ4+rg6FKl70qfUvZk2qPsBzry/vfKtsOee3j2gr0=;
 b=Yekb6M5Y3xlongJVAJCEp3SHkNp+z9wN2aZN6MqySIt02k++taTOJ1ZZEF9mq+zx9Xdv+DWwfkXzFZ4luAKUlkZS1PGgwcFDPgoqZdPNQY8tio3aDDXuIQ7mQ97EX2i3ydebVHpONZhtz7xFKj5f3wDh/fuDnbZTelxoufSf3Yc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DBAPR04MB7317.eurprd04.prod.outlook.com (2603:10a6:10:1b3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Tue, 24 Jun
 2025 09:36:24 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 09:36:24 +0000
Message-ID: <a80c37b2-cad6-496e-b560-85d3f8e59495@cherry.de>
Date: Tue, 24 Jun 2025 11:36:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] dev-manual: fix broken rendering of bullet point
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <5bd4e038-fd6c-5ec4-cc6d-c1b1726f6e6e@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <5bd4e038-fd6c-5ec4-cc6d-c1b1726f6e6e@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::15) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DBAPR04MB7317:EE_
X-MS-Office365-Filtering-Correlation-Id: bd98d206-e22e-4621-e930-08ddb30295dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YU1pYU9YdEZ5QkZNbVR2eUk2aDM0OE84Q2F4T2NHc2lHRkZtM2hTRVQ5Yi9a?=
 =?utf-8?B?RWczdVhOUFBpZVV5bnBPNVAyVHBOWW9kWE1jQzNSL3F6VmYyUzdiNjRiRFBX?=
 =?utf-8?B?RURtT3VZWDZwZVBJaVZNM0MxeVc5Mmg3NXRFRENKRWNTT0FvbFJ3aFQ2ZHpC?=
 =?utf-8?B?RER1S0VqUThjVGVIWnl2bGo0UGVKc0ZScmxDb0hkZDlDVExYM0xCeUVWRjJn?=
 =?utf-8?B?dXlJbVZuaFFOMitnWWRRT25VcU8vWldkc3hxRjhOdEFnUkdRa0J6dTdQcHpF?=
 =?utf-8?B?VFhHbXZqQWtmS2FLc2dPczcxZytRczJIQVVGMWs5bkpwNUo5VGl5S2F4bXV3?=
 =?utf-8?B?SGdzaXBTLzRmdTIxSlkwdTByOG1GVGx5ZC9FYWZkUS92YVpmR0tub212MHNO?=
 =?utf-8?B?ZEFScFVsTk9NNmpBdHM0TlVwWUtackprakZvN05vdlkxSlFPTUdpUU9UREdU?=
 =?utf-8?B?MUdsUmRKUzZBQ2h0U2hPUmExSHZ5dkxlNXVFYXIwNVNWZnZ2UGZybUNHcXdV?=
 =?utf-8?B?bUdCblJsV0dkOUdVdTc4UFlwTzdab2NVcjZOMVhoQ290S0ZNdENSRWFGcU5B?=
 =?utf-8?B?Q1lBVlU5dnducHNGM21mM2swSTM4MTJSc0FmK1JqenVQMUpHWjJDMGV2Q0pk?=
 =?utf-8?B?K2NtZ2l4UWpudkZPazJqNE5oSW1maUl5SjdmUW1GNXdwS0E4elF0S3F3N1Nq?=
 =?utf-8?B?UmhDMGRtRVFBMFBraTBVUHIzVDRUKzdRVG9XMjhuQkF2SjF5a2NzdlpOM0Ja?=
 =?utf-8?B?N3lDS3VXSGdEUkJscHJSRnBHRmNHSWVPTGhPTzJGWDZtMDRlOEpLME5HRVln?=
 =?utf-8?B?c01DZEVJcU9SWXRwM20zY3ZndmlicGhEZnJvOUJVbW9SUWlQQ1lEY3l5Q0tW?=
 =?utf-8?B?dEx0VU96NWQyak9xNnBPZGRkQUFmMmMxZmg2MlpHdW9UMWdsZ29rTjBwcXZs?=
 =?utf-8?B?enZVeTJZbGY2bGlQUzluR2Yza1Z5eDYyWWtvUXZTeTJlYTNSVHJGRTRyZTQ0?=
 =?utf-8?B?Z0Y3bkJrdE9vRVcvQ3lHVnJJcEExTEpubDVRN1F5bUlURS85OUErK2dKdndi?=
 =?utf-8?B?V29uVGFwa0ZUMzZ0UWoxMEZnRUpBZHI2b2lDc0JVYmdSVm9pOXdqUTVvdngx?=
 =?utf-8?B?NTg0MU1oSzBQOGM4ZGlUWDhsemY3VlVjSzNqWUdVR1Z5YlF4VWtvMnBDOUNZ?=
 =?utf-8?B?RVp0bGJIamF5aS9hNTdnaDN3YW1OZlM0dHpKbDYydVNoQnBkL1dWelJtU2tn?=
 =?utf-8?B?MzdDWUs2OUFud21oZUc1RUZ3MmJ6UjA1UGJpSjY5eDBNa0FMck1kZ3hzRHpD?=
 =?utf-8?B?MUNVUFVXTVpqc2dLcjJQMWNWQUIyNkdWak9YZzQ3a29Qc1A5TXRIb2MwS0hv?=
 =?utf-8?B?WVkyeDRtbEZrclVEd1Fqdkg3Mk1EbW5yUkQ5Nmg5NTJxdnI4OEI4R05VQWV5?=
 =?utf-8?B?QTVRMS9CL1h6L0UyYittUlM2Z2V3K0V0dGZmR0RBY0crVzIyV05zNGZWQllH?=
 =?utf-8?B?dUZTWTlBcDd4QTV4bm42cEFmQUVETlhDWVRLcDV6bm45NFpUZ0E1L2xsbkQr?=
 =?utf-8?B?eVFqeGozeWpWaE5GYkt3LzhDTU5WWUwzZzF3Wk03bXFLWmNXVHRVQW40MEhO?=
 =?utf-8?B?dEZIZlFEY3U4a01KMVZFOVhwclc3T3MzSExrc3M5SkRRVW5lanRNc1h3MHZ3?=
 =?utf-8?B?YXN2NVI4cjQ5eVRES04zdERqUzlNVUVOK2NxUmxKdE1NWUk1WjZadG9xYXhi?=
 =?utf-8?B?d1ZyZU90L1dFNUFBNDllTDJ5dnZLVzVFcUNsSTlCblZ6ZVNJRXNjeXFKTUNs?=
 =?utf-8?B?QlJhNVhiRGRtK3M4bUZtWlNxUjJKZDUvanNjVFFGYklEYnoxQk1UNmxVSUNN?=
 =?utf-8?B?SFE1MVZSUms5RkxmekFzdVJHR1JvL1p2bENaVjhwZU5PSnBUNUVEQjlqWlpP?=
 =?utf-8?Q?PgluXyWnYzw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T1ZES0VXdFJIVzhlRzJEemxvdkwzRHMyVTMzUWtkNXQ5cTczc21OQXJuOFBm?=
 =?utf-8?B?UTlmSmFmWDJXRWdSZHBXdTFJWjZoZkhWdm1SRC9ibXN4ZFE3OU9wSlZkOENZ?=
 =?utf-8?B?cmFZaFdlUzVOdHVDVE94b01wQTRXdWg5UGdxY0U5d0F0eUtPNm15UFk0RmFR?=
 =?utf-8?B?bVpOeFNRL2NHY0trVmttN1ZsRExpR1hscnFNeS9BTTlHQ1IwNHZxZUZHaXJP?=
 =?utf-8?B?TDhmT0pGeTRESDNDVUREY2t0eGNxNEJldFkzajJvV2d5ZUl5akFVZlFIOWZR?=
 =?utf-8?B?SkdoUXFFWS94SjkyUmJ5UGV4WU05ZGR6eGI5UVhGbkdYY3FESWgvQ2Vuamtq?=
 =?utf-8?B?MXRvbHpTU1RLTGJFSVp2cDVIZVRxRFRldGFlQ3VqaHFDNzVraldWT1lGdFpK?=
 =?utf-8?B?TVJJWlNiN2JycStnT2FvVGE1cXpqL0pqUWhyTXdZVlJiKzFrOWl0amd2TlBM?=
 =?utf-8?B?T25NdHBFSVRpTER2aEpXUzhRLyt5RUM5S0ZYYk11WUdRRHBJWEsyQ1FTWW92?=
 =?utf-8?B?RjhVZnhpY2ZvR3VZWlFyOWVUUjg2MGtOYVkrMHo5R0ZVSmg4Ylo4dm9LOHIw?=
 =?utf-8?B?Mjc0dWpCdVBVYXZGaUpqYjBMQUh3cDZqZzZnc1Bpc2NDTWRMWWI3aGZ1UTlV?=
 =?utf-8?B?OEwvK3ZDL1hpM3h5VU5SNll4bnZnRkpqSi9CVm9JRkJqeFVZUHpVUHIrOURS?=
 =?utf-8?B?TGVCbm9zTHR1MzhRSHBzdmNaclhlMm9iakxpRzVZSWVhZkx2OXloKzJJRlRG?=
 =?utf-8?B?a29TRUw1QWJkNk5pb1QybGYwYXcxYWNicGhTVmFlWlFqbGtGUVhxWlNucWNi?=
 =?utf-8?B?RWFPWHB1MWlySEhXdTNyWENyL3ozeE95LzR5R0oyOERsRGRjeEl6NXdEYk8x?=
 =?utf-8?B?MXBEbUlUT2VZTmFvNUNtTzluZ3JDcHczQnZzQk85cEtRV0N3Q0tQZzluKzdQ?=
 =?utf-8?B?UmdFek1kRFRnZHcreVhJWnVjNTNhNU1QR2xraVM5YXR6cVZ3NGQxbDIzbm1T?=
 =?utf-8?B?MzIzMkRONzdDQk41Qm8wVUNDWjd5YmRNRkNUR3EzWmRsb0FaMU40K1hqK3l6?=
 =?utf-8?B?eW8yYy9yYnlJREl4Ykt3c2dYNkl2enVkVmt3bWZBb3lKOGF4UWYxUFZWNzdh?=
 =?utf-8?B?RXZtajZ4NWliU3VnVVJQemU5V2lRL2VEU3pjN1BONFFNam9aNGJjelFMQk96?=
 =?utf-8?B?d2k1M3ExVnkrZDBmbjRzUFpCVE5Mb3JTVE5ONXdXREgvVWdpYWFuWGRFandB?=
 =?utf-8?B?Q2JyMmorNjllL284RXFHL3Y2TFR4TzFUTXRHZXg2eTl3V1c1Vy8wNHpaUzNv?=
 =?utf-8?B?RWFIcXJjaVBzNlFDMkZQTGxoc1plcVZvdk02Ulg4OHYrN3JGNlZVNHB2MlI1?=
 =?utf-8?B?Q2xrUzRrNmJHWE5lRlpiWXlDYm5WbkhTcmtxNWMrV05laERCa3VhQzdlRWFt?=
 =?utf-8?B?dTZud3ZEVjZMa1QzeDJDVkNDa1QzRHNyME1xbUdEdElPamM1ZTZDbHp0M3Ft?=
 =?utf-8?B?dm5uRElROVNoNmR5WDR4T3NBVlROdXQ1QldDTTByQkZ3OHlabTZGYkF5ZTV4?=
 =?utf-8?B?Y0xpcGZRQVFoZ2xlck5OQkVZNjV1SzY2UkZrd1V0YVBXZktSNm1OSCtpRlVx?=
 =?utf-8?B?QldBWlB5OTYyOTUvZ3RLSnR0cUxCZlNuYng4UjZwMDlJak9oY21weGMyUzhV?=
 =?utf-8?B?S0hHcW1KUnphYlFmR1FuK1pOb2t1b0VDREdpdnV4RVA3cE1uQ0pwODhhVXlm?=
 =?utf-8?B?NlZkNE80RHhwbVRnTERVSHU3VlVEZ2xIQi9MNndrV3FLQ29CODFtNkFkS2xH?=
 =?utf-8?B?M2Fza0RKRHdZYnZIMEhzNFZ1bGdmZDdhN2ZrNUNmVDRqWGFOd2FpLy9WbDhX?=
 =?utf-8?B?WUZ2RlVjNisyV0ttRkI5MjJhRmJxR2poRWQ5aW5UdUZxcUJRRmp3NE5vZ3Bx?=
 =?utf-8?B?UEVRNVIyYzhuUWFHMDY0VzlOSGVkK2tQL1pLY1dqSFVoUDNKUDYvMlZRM0c4?=
 =?utf-8?B?cGN1VWFXcUY0NHg5bDNjT0I2K0lQRTRrcXd0R3pLV3hxRytzQ2JjTWxTL1h3?=
 =?utf-8?B?d0JoVVBZWldyZHdwSnoyb0FaemdzajQ5ejREYldiUEVGaHNoU081VVFScnRm?=
 =?utf-8?B?QStTQU4xeGEzTXhjNmhyNEI5T2FDZHcya0ltU1h4bVBRcW5seDRtaW90TlJF?=
 =?utf-8?B?QUE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: bd98d206-e22e-4621-e930-08ddb30295dc
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 09:36:24.3702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: huNKS8RII90TdYcPeSa6f9nPPvSqlqLbG54+NUFj49de469cosIgg6QvRkwqjQsxwuVmiwFZC6ujGui5SUePVL3VWZ15RMToUMIpKypiJJM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7317
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Jun 2025 09:36:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7197

Hi Robert,

On 6/23/25 6:27 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> Tweak the formatting of the bullet point title so that it renders both
> the term and the bolding properly.
> 

Thanks for sending the patch.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

