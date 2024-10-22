Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFBEBD2C563
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 14:52:25 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.41])
 by mx.groups.io with SMTP id smtpd.web11.20254.1729608735444697755
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Oct 2024 07:52:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=NSvsdNc0;
 spf=pass (domain: cherry.de, ip: 40.107.104.41, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uP/PiEOnrDxWP2qMsklybv+3pDWezj/MNXFHUE9kiAhfvelf2hGFonVN5+xrkP4Mo2jLZwDKPH8R+BfwhXY1aFFALAMZ0aPKKBKFN+TbCTzvUVvG/n0B4qP/Yk8/owyJubvM/UazFw8+cjtK7Iplvc7s/6BlKYJECueFArmJQa04j6wRcNqH0oYSjJOcOnG62Q31UvtQnXnpYmNz4dpex+v6w2vSWPcnBD3WNWZ760DagJHFfwXjx7HI5U6viw1ZcyOi9B/x5TvW5ka6WoQgBXcSLY6PPl+D7arCrkzoaOos8oYaAEnGtUEcOGNm7hgPaxXH1Bb5qj6GOLAJS0av2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qKVJq9C/0cVjbP5PTV+cxhRNBwj0+7eXfPlW70FCuc=;
 b=MWoFRisVBptpvK8ZOp820AnRposLmSzPq9GFQLtjNq44sqIfFMkhgNYetEUMeTI6g1fA7zRP5Ou/2AV2UB/VXTqPQaN74wmpHyNBA7sjl8R5y5ethQXpQrn1tzhU+2sP7RByGbr9z6/gPTZ5FHKp0AAtvKEN+qeR9WE+vQNJIEbnvR1QbiVn1DW6APf8zQapp+kk0QKvzjTTYl3bf/AExKmwlvm60iGVokDot/wsbyhsji5Uofx3LkQ7WVBVE7uuyTxqCNQB1rrtxe+1vDAl68kciVapS1ln1kVmRKQ4zvQFV/z/OOfartlCqKiabEf6x3mykVKZH+9M4mcZT4VTLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qKVJq9C/0cVjbP5PTV+cxhRNBwj0+7eXfPlW70FCuc=;
 b=NSvsdNc0updGd/fkOo5JI2Jw1KbqsM2c13ACvh3+AuNGkga3mef6Eblb0wcT4cbFs04SJiYOMhOnaMr+R6/M6O120J6WZCl1hwRO7SFsj60DUoaHWFv6kUx0hj8peiRUPaYvvbM1fAPlJsqInr34xDVw8iLP2No3A5R6kRHPLQY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by PA1PR04MB10525.eurprd04.prod.outlook.com (2603:10a6:102:444::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.21; Tue, 22 Oct
 2024 14:52:12 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%5]) with mapi id 15.20.8069.020; Tue, 22 Oct 2024
 14:52:12 +0000
Message-ID: <aad1cebc-3424-4a9e-b9e1-4f60d606c24d@cherry.de>
Date: Tue, 22 Oct 2024 16:52:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] dev-manual/debugging: improve gdbserver debugfs
 docs
To: "chris.laplante@agilent.com" <chris.laplante@agilent.com>,
 Antonin Godard <antonin.godard@bootlin.com>,
 "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
References: <20241021152254.1745411-1-chris.laplante@agilent.com>
 <79f143c4-7d78-4090-88bb-2b0e5ec4c404@cherry.de>
 <D52BOKSQ5RMM.31B7I4X4AJMN3@bootlin.com>
 <fdc83afc-d274-4a90-8fbe-ef0717f099af@cherry.de>
 <DM8PR12MB5430C3DA2E9AB3EC2F7EEDD18B4C2@DM8PR12MB5430.namprd12.prod.outlook.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DM8PR12MB5430C3DA2E9AB3EC2F7EEDD18B4C2@DM8PR12MB5430.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P190CA0017.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::30) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|PA1PR04MB10525:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d48e07d-dea3-473c-ac85-08dcf2a91c45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UmIvdVV2bmoxTEV3WEtTZ2xRS1E4U29oRTAyaDExcWZVTW9hNEduNFlyWC9k?=
 =?utf-8?B?L3JQeXJPU1RJM2xKRkdoOG5YRjZYTjJCakZTc3hpMkgwRy8vNTBEam9pb3pN?=
 =?utf-8?B?MGd3WlVmNkhXbVVrbUFxOWE2bUdUSTlpOVNMRHg5VTkwRi9lMGM3V1U0Mm5Z?=
 =?utf-8?B?R3dtK2VsRDZGS204ZFdUbzE4cUNDZGpZQktZNGhaM3orY3p6WFNRQU5YSFFN?=
 =?utf-8?B?cXdzRURzQUZZUG11ZzhmZnRuYzJoMmt1Q3ZjbS9QMmRBTmV6K3dzdkRQeW1Z?=
 =?utf-8?B?Y3NobHg1TEN3bVdzR0JKTk5OTmhTcitxb01yUEVRaTMzY0FOVnIrMmkrRzFX?=
 =?utf-8?B?Y2dJNjYyWVpJeWJHVWZidzBFQkVlTGZlN3N4UUFORjdaSTVTVDNVWWxCMFZ5?=
 =?utf-8?B?SFJmM2t5WFR6OFhLK3gvRmgrcFgrcFNZL1l0bDRWNldlNGpxV2V1RGtmeGN4?=
 =?utf-8?B?dEViSmR2dkNYY3pjdWVCdGxPTW1EM2dQck41eXBiOEEwV1RScXBBOFU1N1lM?=
 =?utf-8?B?RlhCOWVFdzVId3BwUCtUbzk3aU9RdE04cmR0ME9OYXh5aTExaHVrZkRzd0sy?=
 =?utf-8?B?MnE0dFFJVUYvdjlZdlA1UGlKb3B0a2tHTEI4ZTNoemtFcnJVLzRCUUZzSW50?=
 =?utf-8?B?OXptZWQyR3BQQW1EN05waEN6TmpLOUY2bFh1Sm4wZm9VYThpV2EveEZZOG83?=
 =?utf-8?B?ODZMT0hxdmZjVXBsSmNocGJGRENYZVFqWk9xdUFvMWNwUlVoeWxEZkdqcDFi?=
 =?utf-8?B?TVo1RjVQM2hWYWtRb3ZuK1A4ODIyNzdrQkZnTk5xZzE5SnpUMWM4ZEJLUndk?=
 =?utf-8?B?Qmg5MThmaTdBTkE3MEUwSVBFV0s3alZFbWEvb2hXV3BkeVYyKzJRM2dZZStW?=
 =?utf-8?B?WUNCNnRtbG82T1FmUVFUZFR4NW8wS1I0UEh0RkZVOFo2VXlXZkhIZnkvZ2tC?=
 =?utf-8?B?bURKTUFjSmR5K2o1bTd0M2dORk8vY3FQV2huU3hRVi9xNHdBOStVcWFrb280?=
 =?utf-8?B?QjJTeDF6OVNPTkszd29lU3o1UXNtd0VRUHl1aWFiMCt5QlFOODBUM0d3WklF?=
 =?utf-8?B?MnFLb0VRY0JqTTE2RWNkaXZ3Mnp5TmZuZDVBKzNYSnZEN1FUSkVhWis1TTJO?=
 =?utf-8?B?eWJvajVoeVVZSUJrRGZaeFNzSkd0SDU0UlVCalQvMFM5eUZIVVl0NGxGb2RK?=
 =?utf-8?B?aThCNUMwTUU0bHZtMkltbng1d2dJbVZncWltcERTNTNPKzVIRmtJUVc0UktD?=
 =?utf-8?B?Z3RqdU5XZDI3Si9iYXNTNEszcGdEYmdBYnBwcE02cDZ1M0RiWkQzbmU1NVpm?=
 =?utf-8?B?WVBXYnUzRk4vRWE2THd0dlIraG5GK3VmdnB5Z3FWSXZiR0NBeEowcWhtZC9R?=
 =?utf-8?B?azBzb3cxVlgxY2NDcDdoSVFLWGI5Qk91dXovMzZVME11WjZKV1ZESUVYa1lk?=
 =?utf-8?B?T0x4eTV5cDNtaUtGd2xBTk02YUk2QWpMNStSUFp3RXVyc28za2t0cFI0enlx?=
 =?utf-8?B?aDJGU255ZUZhSFNNY2ljQmpQQU1CUkRXYVprN09UQ3ExQy9YdTJpd1VrWkNO?=
 =?utf-8?B?T0tCZSs0ak50ek0wMm9FcmswRm40TGc5bC9SWjBJelZuNmpnazA3TXR6QnJ5?=
 =?utf-8?B?bnAwNnMyM0U2Vll3S0F3L2l0Y0owdVRTc1dwR08rMm1pVkE2dXFOVFUzb0pt?=
 =?utf-8?B?RmN1T0JyK0hBY28wSnBVcFYybjh3TUlZVWdoZVVaaTQyZnM5UnB4LzdsRVJV?=
 =?utf-8?Q?p0qr4SpSPZQk3Sk47gN4pEbCJqDq6bZRSlmKjqt?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QjR2TWdKVGdTS2IzazE1bktWRmV1YkhpVWp4THVMTHM1RHBGVEQ0M2s1YnJr?=
 =?utf-8?B?cC9wTHpZaDB3VlE0R0plOSt3Zlk0SzE4RFJ1WTBZYTRXUTV6enBkUnNPNnNO?=
 =?utf-8?B?UDBUREFWbTlCeitoS3ZQSFZOdTJtWjJXaFRFY3lWNUNGYmFBRmtJcTdsS0ZN?=
 =?utf-8?B?ZnFUNkU4OFZTY1B2SkV0VmtPM0xHdzI3dlVScnlweHAyelpBL0ltblBhbkhs?=
 =?utf-8?B?MUFKakVmc1RLQTFnQmIvSVBXZTVEY2ZTTFczUmxoNUROMEE1ZWs0UHhDMXp0?=
 =?utf-8?B?UXR1dnJLYXlyK1J3dmJHQnJuWDc3Qzg4SnhVMWpGUXYzVzl6OTNkSTNqZElt?=
 =?utf-8?B?c0VLVG9jeTFnRDZabUlSWXZ2d0RpUlpHNEJrWFd5ejJqY0xla2tyRGFiTmI4?=
 =?utf-8?B?d21hdVoxSUJpQy9HSkI5cmhiNUZncEdOUlJyU3Btcys2S0YxRWNldzI2VkZG?=
 =?utf-8?B?VzVWWHpGdGtnL1l6K2FhY0VTdTZpOHpwS1lIbWpQaGlQV3R5TytYZkNCU2ox?=
 =?utf-8?B?STYxL1I3Y0JIdERvbWhrTWRFVGVncWhQcXZRWHIzUXExYWU1SWRRUWFkYTlM?=
 =?utf-8?B?TjRUNjM4UFpVd3oweWFBa3RHNDJBSWJhQlMzd2I3cFNxQmVxWlZqa1k0bXBI?=
 =?utf-8?B?d2xmaTFVeU1OWkQ3aS85TUR1aklUK202anhWTWdGWVpFMFFYMUI3TSt3VE1M?=
 =?utf-8?B?TnBJbHNJTlJaV3F3aUJOdlVyT0Zwc0l6WVB2WndybXlacXpoc01VajJMUVJo?=
 =?utf-8?B?WmNtaVhGcXZDbStLa0c0THFsSlZKKzhvZG9IVlhBMXE0SE5Ec2h4OUN0QXhQ?=
 =?utf-8?B?SXJEbDdFWm9ZcjZkZTArS243Tzh3S2Z4dTJzUVZwY3k3Mlo3VEgwVTE3UTlB?=
 =?utf-8?B?eS9BOGFKcnNrMVhPd25wZXJ2SmdyL0xOaWZSbHoxV1UvcTl3Nm52YURoTVFy?=
 =?utf-8?B?Q0YyUlBtcEROOWlkcDZtam5aOE1BVUorbGFkaFBZWlF1NEM0d1lsU3V6V0ta?=
 =?utf-8?B?VXdCUGdlYVd2cjg3V05lZEwxRG5vYkN6UW91S3dMSjMzMEVLMkVxR0MrZWNm?=
 =?utf-8?B?RXFiejFkaWN2NG84TjllNnFLT2pMYnk4UDFGSTFkNmlYb25jaHhjSkE0U09y?=
 =?utf-8?B?TElwWHNhU2ZGQlNiN0xuV2I4YldrdlI2VzRXbU5TQm1nVlZMUUR4WTM1WjdZ?=
 =?utf-8?B?dnFDd2FqcVdnN0c5alpJcWt6NEY1eDQzQjllcC9RWlZrT0hDbUphTHRxSU55?=
 =?utf-8?B?SDRtd1ZtdDVoQ0svZmlDQjRLZEF3KzVhc3BBY1hJUDBCNG9iZVZSK1VLOW1G?=
 =?utf-8?B?aFZYWWc0TjAzMVY2dGhXUC8rM25QRzl1bVZrRnZESHlVVFp2dGI2TEFZd05G?=
 =?utf-8?B?Umd0K2FFZGpWWE9jMndiOUVaeTRYWmJuckdaWFR2RkxmVTVBN1JmNjRLYVoy?=
 =?utf-8?B?b2lqSXE3MDRjWGtvSVljSXZaUjZOQlE4YmI2YkRSd0hpMGdrQWZnZVMzWXhw?=
 =?utf-8?B?N3Eyb2lMOWJYcjd4MTN4TENDN0ZEWEF5eVVXT2RuQ2ZOcUxRTW8wdk1EN1Fa?=
 =?utf-8?B?MlJ3dFROejBSNUpwcXNkKzRSV0N5cDE5UG1iSDhhWUlWUHR0VTh2WEtjb2Yv?=
 =?utf-8?B?aTJpck1iVElCSC9rdkd3OTlXTXhLb3p3WkJuN0NNbE1TeXVtWWdCTU53U0Vw?=
 =?utf-8?B?U3BpOUN0VVFROGNiU1pSR3F1SFA3cXdLWm9WSFJmeXJ5S1JCekYwUHU1Rmdp?=
 =?utf-8?B?amVQNU5jV3pXZGRlVUdJaStJTklIeU5FNW52MWxhQktGMDVlK00zUTdxMnY5?=
 =?utf-8?B?dDROTjdRcm9Vamk4M3hLOEc0SEo1TXdGRGZvcmxmd29QbmlocHJLSU1GK09m?=
 =?utf-8?B?ckRTdFp2c3VmRTZya1F5eER6NkpncjJXVitwOGNGbVpZMXQrWk1SME5kRmVx?=
 =?utf-8?B?K0F5cUJjazg2UTkwVlVoZEJyWE5KVjFCMHNyUzBVS2kveHB2dlZ4djcyUVFm?=
 =?utf-8?B?dGUvV1lFMmdCZC90cEZQOVdHQWhpS0k1V2d1RHJDZjlQN1RwbzlYNTN1R0tC?=
 =?utf-8?B?dHBNcHNQbmRKMXpvbW9XdzMvSE43SVRxT0VIMTJTa0hPWTQvR0hOclpyK2Jz?=
 =?utf-8?B?YnRZTmIveE55ZFc5WVJFNlhlc0x6ZXR2VjFmUjZ0NTlnL1hzNTRtWUQ4STFT?=
 =?utf-8?B?cGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d48e07d-dea3-473c-ac85-08dcf2a91c45
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 14:52:11.9278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /WkZoZfX9aO6L39qSNdXgmklHwmsXrlCx8SP8Zs2AUT2Xet5dKyICeUPooZIR5ErpJQl2Mmc86JXF7dbfxlGB8bx/Dk7SvN9ck3N+FbfHWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10525
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Oct 2024 14:52:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5567

Hi Chris,

On 10/22/24 4:39 PM, chris.laplante@agilent.com wrote:
> Hi all,
> 
>> Hi Antonin,
>>
>> On 10/22/24 2:10 PM, Antonin Godard wrote:
>>> Hi Quentin,
>>>
>>> On Tue Oct 22, 2024 at 1:57 PM CEST, Quentin Schulz via
>> lists.yoctoproject.org wrote:
>>>>> 1. Make it clear that IMAGE_FSTYPES has to contain tar.bz2
>>>>
>>>> Yes, but isn't it done automatically if IMAGE_FSTYPES_DEBUGFS and
>>>> IMAGE_GEN_DEBUGFS are set?
>>>>
>>>> We have a selftest here: meta/lib/oeqa/selftest/cases/gdbserver.py
>>>> that doesn't seem to be adding tar.bz2 to IMAGE_FSTYPES, so I assume it's
>> fine?
>>>
>>> I think it might be because qemu.inc adds it by default (not a oeqa
>>> expert though :) ). Here's what I have by default with qemu:
>>>
>>> ```
>>> $ bitbake-getvar IMAGE_FSTYPES -r core-image-minimal # #
>>> $IMAGE_FSTYPES [3 operations]
>>> #   append /build/../work/openembedded-
>> core/meta/conf/machine/include/qemu.inc:18
>>> #     "tar.bz2 ext4"
>>> #   set /build/../work/openembedded-
>> core/meta/conf/documentation.conf:215
>>> #     [doc] "Formats of root filesystem images that you want to have
>> created."
>>> #   set? /build/../work/openembedded-core/meta/conf/bitbake.conf:844
>>> #     "tar.gz"
>>> # pre-expansion value:
>>> #   " tar.bz2 ext4"
>>> IMAGE_FSTYPES=" tar.bz2 ext4"
>>> ```
>>>
>>>> meta/classes-recipe/image.bbclass and
>>>> meta/classes-recipe/image_types.bbclass are the only places where
>>>> IMAGE_FSTYPES_DEBUGFS is actually used, and it seems that we're
>>>> adding the content of IMAGE_FSTYPES_DEBUGFS to those of
>> IMAGE_FSTYPES
>>>> if I am not misreading it?
>>>
>>> In image_types, the following:
>>>
>>>     fstypes |= set((d.getVar('IMAGE_FSTYPES_DEBUGFS') or "").split())
>>>
>>> Is an union, so if tar.bz2 is not in IMAGE_FSTYPES it won't work actually.
>>>
>>
>> It's a union, yes, but that's why it'll work :)
>>
>>   >>> a = set([1, 2, 3])
>>   >>> b = set([3, 4, 5])
>>   >>> a | b
>> {1, 2, 3, 4, 5}
>>   >>> c = set([5, 6, 7])
>>   >>> c |= a
>>   >>> c
>> {1, 2, 3, 5, 6, 7}
>>
>> c.f.
>> https://eur02.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdocs%2F&data=05%7C02%7Cquentin.schulz%40cherry.de%7C24532c178926442d8e9908dcf2a74a1b%7C5e0e1b5221b54e7b83bb514ec460677e%7C0%7C0%7C638652047574497237%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=TmSlV%2BfHq995xV%2Fmbd4RA92UZ9o8KEkeIfh4%2FtJlgzA%3D&reserved=0
>> .python.org%2F3%2Flibrary%2Fstdtypes.html%23frozenset.union&data=05
>> %7C02%7Cchris.laplante%40agilent.com%7Cbf8562bbfb1548b643be08dcf2
>> 9393ec%7Ca9c0bc098b46420693512ba12fb4a5c0%7C0%7C0%7C6386519
>> 62912305989%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLC
>> JQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata
>> =41m%2FAwTD9msyScku1ytng1IKYXPKbakuOSgpMFdLaUo%3D&reserved=0
>>
>>> About the other IMAGE_FSTYPES_DEBUGFS references, it does look like it
>>> should add IMAGE_FSTYPES_DEBUGFS to IMAGE_FSTYPES, but it didn't
>> when
>>> I tested it, so I'm not entirely sure :/ Maybe this is a problem in oecore?
>>>
>>
>> That's basically what i'm trying to figure out. Should this really be documented
>> or is it rather a bug that we should fix (and could document for older
>> releases)?
> 
> The imagetypes_getdepends function you are referring to (in meta/classes-recipe/image_types.bbclass) doesn't create any do_image_* tasks; it only determines image construction dependencies and generates a bunch of "<dep>:do_populate_sysroot"s.
> 
> The code for adding the tasks is in meta/classes-recipe/image.bbclass. I checked and the reason it works in selftest is indeed because of qemu.inc:
> 
> # $IMAGE_FSTYPES [3 operations]
> #   append /home/laplante/repos/poky/meta/conf/machine/include/qemu.inc:18
> #     "tar.bz2 ext4"
> #   set /home/laplante/repos/poky/meta/conf/documentation.conf:215
> #     [doc] "Formats of root filesystem images that you want to have created."
> #   set? /home/laplante/repos/poky/meta/conf/bitbake.conf:846
> #     "tar.gz"
> # pre-expansion value:
> #   " tar.bz2 ext4"
> IMAGE_FSTYPES=" tar.bz2 ext4"
> 
> 
> One simple solution (untested) could be:
> 
> 
> diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
> index 00f1d58f23..c7ad272339 100644
> --- a/meta/classes-recipe/image.bbclass
> +++ b/meta/classes-recipe/image.bbclass
> @@ -400,6 +400,7 @@ python () {
>           debugfs_fstypes = d.getVar('IMAGE_FSTYPES_DEBUGFS').split()
>           for t in debugfs_fstypes:
>               alltypes.append("debugfs_" + t)
> +            alltypes.append(t)
> 
>       def _add_type(t):
>           baset = _image_base_type(t)
> 
> 
> I can test and send in that patch if desired.
> 

We need to send at least one patch.

Either this is the intended behavior, then I would recommend we make the 
selftest use a different fstypes than the one in default IMAGE_FSTYPES 
so that it's explicit what needs to be done.

Or we fix the missing fstype(s) from IMAGE_FSTYPES_DEBUGFS by adding 
them to IMAGE_FSTYPES automagically. I don't know if this is desired, 
Richard would probably know. If we go this route, I still believe we 
should change the fstype used in the selftest to use one that isn't in 
the default IMAGE_FSTYPES to make sure it is actually added by the logic.

So... don't know how to go forward with that :/

Cheers,
Quentin

