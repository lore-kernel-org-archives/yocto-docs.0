Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 551F1CD4855
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 08:31:23 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71036.1778574675230764016
 for <docs@lists.yoctoproject.org>;
 Tue, 12 May 2026 01:31:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=WuypkfzU;
 spf=pass (domain: cherry.de, ip: 52.101.65.44, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L3OKsULeZveOyD4dZMMxs0a7p6zHTcKaQpRElD1U9XB3eo7h6648Bp6fJhUGhImyoy69wKkIdc566NopzaRKFVgIrkM5WkyyVus0UJExkk4zZQinehYp22piKRfMdHHPe6koS9251EJ22tnWpfspetWqsphBeXrRp+4AXIDkn+KxUwYI3Jc041eUztUZchc1RkOgyzwe0vhF/3BG25YAaumrxdi8quyxEz0cOvuiTfAbuvfE0Q4592NQT9L7/PRsoDpQ2ZT+IsY1zaKCujUI04eaZzh0QlpIpeiQuvw3ds6G43ioAsZaEHz45tVJ2pkqOW+wRoFFoLaewzj59Jd05w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BnFbKHZmGM8gNva2OIx6hVD6DXPBtOgJUFwKTo5lRUU=;
 b=oz86f7IwwF0VoIKR4xlz2IXGaGam6K3ra01nZMtF0+4BteSq/A5a+YNau9UZ30bnmljEDm4qIqto3mhA3sFYEOky/za/dJMNqQSSJFOjeLpmIWfLgUz1vaUjHO4JjeK+q2bdXzS48rBpDPZGPo5btRhQS47kq67DGmrgUszILFP4NxmD0iwlHvutt68AYJZdM1t1mhmeeb+FzCiNj/W4DXHiqEKPasqbEdAg5/HzYM51bULrfhepeN5o9n6sEgFs723pzgPGTjMVtcRKnPAEoRNgjqcwjV6R4G4iD5L6Rjx+CLoCB1D9K7yc+zSnny9n5E55vIkvfS2GeE+2Gpuzdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BnFbKHZmGM8gNva2OIx6hVD6DXPBtOgJUFwKTo5lRUU=;
 b=WuypkfzUfnTH6MZuVQz22K6OgZ7QC6sk7pKsqojfrDwf9/hArHbkiX1f/y4/mNwj5ple6fElSwmyd+LfZk2BDD7fUuH1u/iaIfIdbWMaiegeDNdCmjFiBedH9VOppjtP2Vr+OakWESd5/9f3koSfd+LUZbkir+Szyf0M9GP3Beo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by PA4PR04MB9661.eurprd04.prod.outlook.com (2603:10a6:102:273::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Tue, 12 May
 2026 08:31:10 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%3]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 08:31:09 +0000
Message-ID: <5cfce2a7-b6e1-45cf-bee8-1dde57f8272f@cherry.de>
Date: Tue, 12 May 2026 10:31:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual: replace "naive" with "simple"
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <20217fb6-04ea-6f25-37fa-5cdd6d62a92f@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20217fb6-04ea-6f25-37fa-5cdd6d62a92f@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::22) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|PA4PR04MB9661:EE_
X-MS-Office365-Filtering-Correlation-Id: 805337a5-4f00-4abc-7b44-08deb000d11d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|376014|1800799024|366016|56012099003|22082099003|11063799003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	EDJcBv6LppZaoTgHVrgLu/8RjB5apFO1Zp3rtGV2ePWZyv2fvc/hjuZEBUZ5wCO7J86v76taFiD/kTsjDKt4fQfRhffb7Zx2ypC2bNoRA8nvdBkEg7g4e48pWg9Jhhq5MR8DPnHf5yLrn35g2IkS1uAyNu10F9uHGxOXPS6CE8lHjRkg5FNUB3lkOD0mnG3G+WpIPZeQu5pkrUpuSBna0onGBng5UeHHq9+FSCSBJ5PdFqxvtAkwcilWW+LD+/SATQxpvr+1j0d9L2bXknkpSjxtvRORGgcCvPWSzI1iPNhVsTT0f7lpUG7D3O07GCKjsC7RqNHv4+UJSxJh3oHUk4C4szuMxm6+So+HaKGtrVtc6JOvfP1mK/Du4RFVjY/JHre5UCKHqeJxsHFDUSNrQRV2XTb2eGEsZ/yfKcM4yTSzoiUNDrxid04owbhbBUFW3aL+mwdxd3cUsWAjYetYnfMrzGwRzLhSoPl/CjgQtcYbIZfU+V7xlyRTGhg3Bhc1HsNpC4rB4F98a/D9HYpSvX9gTXkbmCrK9/yEYjkuFuxr1ZZRHUJaiMsPEOr9q8/vyHE7I7bb7z2E6WmsC2ugYGtVvUseWkWTypMD6xQoSANNplzTNKAfcE370OB5OzFFAsAp284dkrhgsDtNcYmwYwgSkektZZs/MWy9VFuvp+iOqSlRWCfhdEnzc5q2i3Js
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(366016)(56012099003)(22082099003)(11063799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NFQvRWozWm1JTGRBT0lXam9CVVlVcEI3aDNrVVRTNlhyNmxjSXY4RUI0WGt2?=
 =?utf-8?B?bS85OFR4VDdJU0pjQ05pTHpnZEl2STk0dG8wRjZpcDFoY3lOWnFiOERhbTIy?=
 =?utf-8?B?cVMyZGJRc3prUDRxdVA0Wm9iOEtXMEhub3plalJXY1o2MDZ2RmcxRElyNmNp?=
 =?utf-8?B?azZkRHN5NlNwUXBhSVJsYUZNMFgydVl3WjRqR1JYd2Y3NXpPTklOUW84NHBU?=
 =?utf-8?B?bkZnYXRrZEs4amhJcnhGdkdGN2YrRi80OG0yOFdYWGszNFBBOE9nNnJFb0FI?=
 =?utf-8?B?MFNUVzhiVXBjMlRGK1B5QWZ0VWdzVFBLK2M1U3JmdGxrTVRmWnN5bUJKUnpC?=
 =?utf-8?B?QmVjRnhDYnBjUlpRSytESkI2V3J1SVRPMk42ODFsYndxcHEzYXJ0Tlc1OGlG?=
 =?utf-8?B?d2JIcUx3cVQ3a1JqQkhMYWdtSWJYVU5Sb2dKNS9QeUJnZ2V1QzJhR0I3Vk4x?=
 =?utf-8?B?M0x4ZkdGaHVTZEU2NGQxdm1LOG96TXM5SlhiWWdWYStSQ0pucm9tL09YRjU5?=
 =?utf-8?B?QnllVnVudzZ2d3BXTjIrZ0xFNzl3bm9MLzE4VkV5WmVVdld3Y3VKazBjYjdh?=
 =?utf-8?B?NmdmUUpWdS9RSW9aUWNJUnBVT3hMc2tiS25mRnFUNGVIZnc0aHpHcGgvTDVB?=
 =?utf-8?B?ZUY4QlcwUnN1VW5jN29YNGdta09JNTJuQnQreXNsQTNuTUxHQkFUclV1TnNq?=
 =?utf-8?B?dVdBcnJXMDN1YUJXc1pSdkpWc1NmNnN5dUxCbTI4dVB4R0M2WWhPNFRhMnZv?=
 =?utf-8?B?NFlKUCtvUTIyWCtqTFBVSllPVzVnaFdDWjkzNm56UG5sLzIyMFA4VU5Rb1l0?=
 =?utf-8?B?anE3ZzMzL3NQcjQ2UGN0RkFYQlovSjhlcDRZNXNXL2VNR0ZZQ2lsMSt3dVll?=
 =?utf-8?B?TVNCcy8wdmdrbC9CTDdFbDlnS0dMTnNsN2svMnF6UnpDUDZkdVE2MUpXelVJ?=
 =?utf-8?B?VUY2SVppUlRNK0FZT25WKzFlbjlVcFI0MktyUkE4eXNVU3BBTTZBU0lxc0ZW?=
 =?utf-8?B?Y05FOWR2UjlORU1SMGltYWY2MjEyUFpPc0NrcU5VczhRK2lUMTlCR1QrTFd0?=
 =?utf-8?B?TmlPY1EzQ1FQN0JlbEhLL0RsbEFYR1RnV29CMzJGYjFkbXphb2I3S0ticmhu?=
 =?utf-8?B?VWlzYnVSTUZEdFBYYjhRNXBzdkRpSk5Vb1pyZGdLZGJBOXpQR0lpUW0zdElP?=
 =?utf-8?B?TVRDMWNaRU9yeHJ5OWVhUGRXc29xa1puQjlRVG1UOUc4MjFvbURXaldQUUxj?=
 =?utf-8?B?QnpDQ3hyZnE1N1NFMW1tTUVpOWVYRGM1RktHME9uYktxMmJhekFudnhFM0FS?=
 =?utf-8?B?SUFCUkIxbXpUU3N6TStxdjZvVG1EUk51ZzRoMUNWamRqTy8zTlpZbUtFaFZD?=
 =?utf-8?B?RzlPNzdYdkY2Sy9GTWxqNkNERUdoMll4QUZRaXByMnA5cXR6VU1FMUNkUzZw?=
 =?utf-8?B?TS9PWVVhVEE5dXQ3TWJxd1lSTUU3QkxMWTREVkJSd1VxWFpmSGJQMEdPRm1s?=
 =?utf-8?B?dnJlb0pod2V0anFpa214V1ZnQm5tb3J0c1FTK0VoajFPMlk1eTFnQlNqTHk5?=
 =?utf-8?B?QWw0bUJTMGszT240Qm5tZi9lOU1wMDd1ZmlWdkZyaHl2LzlrSjU4eWJ2TzM5?=
 =?utf-8?B?ZWRzNjlPM3dyeWsxektSUEZPdi9VWklhQVZkNGMwNUNuS21PaUR0c0ZMZFFE?=
 =?utf-8?B?V0pkNmRHZXRIWC80cHcvWTIxV0k3T2ZwUmc5NE1kVzRNVEFyN2RJenh3dkVZ?=
 =?utf-8?B?NDBlNHc1QnFxQ1VVZ0FKYkFOVkpzbm81bGdYU1ZqZFcvdWdCc0VFWEVmUElj?=
 =?utf-8?B?cVlXbmtqOVdsSmQvNGdCOFFDMVFJNTZYSkZUS0lsOXNXcDNYcXZrRFpPc1Mx?=
 =?utf-8?B?Z2lFWWpLRm5HU3JMM3RRSjEyT1NvcXhRMHJDVUl3VzR1RWlwNDVXaDZ0MWZk?=
 =?utf-8?B?YytIemRsRXZEVE9HQyt3L1k2NnNTdFRpSlFpOGx1blR1UDFEcVhUMlJkQzQx?=
 =?utf-8?B?UXM2elFJNTR4ckRWcGxiYXRYTTA4REJ4ejVvV0lVZnAvMFRiamZRditLcjFU?=
 =?utf-8?B?SkJiUUdBb2t5TjlEMjBBUU9FZTY2MXFod2NZMUlWT3h6U0RiNFdlSTVMaWE1?=
 =?utf-8?B?TndpSXZuZGkzVWFZSENxUkNVa0JiR3dTUGozY1NzdWxINUFnaEIvMFVVQ1BJ?=
 =?utf-8?B?QWtBYTFwd2JyeklGVXB2MmJmb3h2bmg3MnpVakgvRFp4RWVyYUI5QjVwcXI0?=
 =?utf-8?B?TkxaQVdIcjRxTlcwTUkyNC93ajFQL1VWTEhmR0pIZExEYUVldDlKZWxuVGk0?=
 =?utf-8?B?eE1LZCsyenlPNlVOZjB3bHU2NS9NRUE2VWFXSGNCUWk4bkdaMFpDQmF1ejEv?=
 =?utf-8?Q?zH/N6GCOibcaPLqQ4I1XvNl6FhmPuIDkK3L+PozJuQmka?=
X-MS-Exchange-AntiSpam-MessageData-1: f1E3AOBoeAVrLkbePmQY4vy1zX1D3Ol50Vk=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 805337a5-4f00-4abc-7b44-08deb000d11d
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 08:31:09.0500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YpZdlfs1G/T7XhgOQJWS8SIyHlekAZ2+eyhTXDzKnMewfw8W8dRJw0mpUVDi9m6wsiNtwmp9HInj0fCfa1X3dx1wjkc+9WszyAMzJedRbSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9661
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 12 May 2026 08:31:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9455

Hi Robert,

On 5/11/26 12:05 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> Replace the word "naive" as it potentially comes across as a bit
> patronizing.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

