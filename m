Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CADBD3F078
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 14:50:03 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.62])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14667.1769611799176854897
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Jan 2026 06:49:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=YmBPCAQa;
 spf=pass (domain: cherry.de, ip: 52.101.84.62, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FjU/PVeKvw4ur9tGSLpAcuFMuWfLTI/ENkVviD7lMJIDgt64riJdL19z8Fqiim4xg2h8YDvbCYEsK34LhVV+7/O1cgWDjADQfeZVSyNLK8fVBPkOdS2UpRpavEzCBFtzkYHbT8hVn9WEZPpXH3pefw9HHd0N0MBMLcPkaNNT3ZTSZQaRzL4Bb8MVaWc8VNVck2XpUQlRm3YUsQ2frIzAVdxrE4a+OWk7qSvGwqBpRi7Z4CadZG/sJWV/JEGT0eLWyPneUv7cO0HZtq+ySOF7Y3fkIRE9nzrB69h5ZJnw6huIl8/n7BdkUcvSOZTRSO8ONzytZtOM2k0ARVBRAtSTlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q/WmNPLJ80nbuKSGZwLeYAeuBa4woYBrxnbPFBcSSjA=;
 b=ksU9Yz7vVFThg6JosQ8L59bpsyqAJ59QkLxzprI+PouT9j/lx6U2NzeF80xlWiofakePrnFLpL6gh7gL5lhRZo+22hYYcS2klK3vkidfMGPW4sDZ+5UQBev05zIIHr4wF+fqDo3hvBjwEoTSU9ykg6dvo/dFj8dSgLCFs4auSxCPGQfNCVsqTW732YCDBn6HVy9TCXa6l/LIx61Pop0kuLjIpoTJL8PyY2GxciLfA20IUIlGxMZeBfEGZBQVyDRyfMFMPKJKXmB7cbaP7WuopwrS1epzkY/bHSNzwAww1lmuSywo0Gc/RGVs5ffZNmktKlE8fp2k8/Lw7fg9zspGoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q/WmNPLJ80nbuKSGZwLeYAeuBa4woYBrxnbPFBcSSjA=;
 b=YmBPCAQapFhlxYBcTdhNSFrAXc3siKOGIVxgXEXNA5vOhw77+4HQlCZzSCW7bjpCWbzcWXVWw1SaQnUeD0AMeltUzxpmtQKYYSdKzjELrWyaKkQ4QruUH+Tpuw6zk+dn3xW/KF2qypt8MTZrg2LUAu/ljZ5nQoZ2rY7GxsJ+Lzo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DB9PR04MB11600.eurprd04.prod.outlook.com (2603:10a6:10:60f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 14:49:55 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 14:49:55 +0000
Message-ID: <2ebaa90b-e57b-49f1-96ec-ad91af710e52@cherry.de>
Date: Wed, 28 Jan 2026 15:48:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 51/56] ref-manual/system-requirements.rst:
 remove obsolete poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
 <20260127-remove-poky-references-v2-51-74bf80cc4e5a@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260127-remove-poky-references-v2-51-74bf80cc4e5a@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0021.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::29) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DB9PR04MB11600:EE_
X-MS-Office365-Filtering-Correlation-Id: dd8e303f-fa9b-4dfc-5eb0-08de5e7c802a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M1d5ZTl6RXNQWCtEQnJab3A2QmFtV3owaDRnNWRLeWNFTGh6RFZLaWFEWThU?=
 =?utf-8?B?WHpQWXZDTTRqZGdGZy9COFZLa293WE13dE10TUJEYndRc28xeSt3NE1VVTVq?=
 =?utf-8?B?aFFpeG16YnJ1MnduUFptczd4MG54ZEtSTXhtaUlxckl3dDAvejFSMlB2bGZ1?=
 =?utf-8?B?bUZOZ2J0dWVtKzl5b29vM0Jhc0wrSUNIZjQwOEZIeitPb2dENkVqM3VsUzVT?=
 =?utf-8?B?R0FFVm9CMVo4d2hwd2FDSmcvLytSQU1RNGRvYVpxUmp3TGhJVElTcEgyRHh1?=
 =?utf-8?B?S2F4b3NKVUlaTXYrcUFQQmZtUFBaSW52ZUxCUCt0aEM2NFdVQTZkZW9pY0dJ?=
 =?utf-8?B?aWZqNTlpb2hBZjhmMFdiZDBvcmt5eTE2Mjd2VzErTlROZVdHOVZMc2ZtT25Z?=
 =?utf-8?B?cmhmY0hleVZOL1VFQmZwTVIyZlZMSVptNXhENWRkM09CTkZib0FuZGlNTzcv?=
 =?utf-8?B?MnNwa0xYaTNKTlFvSkJadXY5MVRyUEhaNkJTa2ZoUGw5MlBiMUVaK3dUUjdY?=
 =?utf-8?B?M3NRT2ltT3NNT0RFSTFkUWFwbGwwL084VkVDRTMxUjlmcTJLeWJ4dkZYRGNV?=
 =?utf-8?B?L0dZL3FTUmhQWmRuaUlLb21Ob2ZvaTFTMHhwM25zYndRNUdob1hqSzJrNFNa?=
 =?utf-8?B?eHJsNG1LbmlkcW8xTEZFWVE4S1NFcXRIRzZOMHc1Z0hoUFVIaWZ3eTVNSjZI?=
 =?utf-8?B?dW5LbHAwekFsTHdPbWo3aUdRNjlVck5vUWQyZUJxY21aSXNOUUh0VUp0bGo1?=
 =?utf-8?B?MzlYRjNLa096Wm9yVGRmNkxSYnZiemNiQkJzbjdYekg2Y3dNVVpXSEhGOFVj?=
 =?utf-8?B?N05zaXM5Tmt5TDVITElQN1JNSUYyUCt6ZmxXM0dSQlBjYlRFM3ZnZ1NRaGp1?=
 =?utf-8?B?TmZST2J6SDZRTVhJcDNraXh0bE9malptK2YzOWNtaHd5NVVRWGpZVVQwaDF0?=
 =?utf-8?B?UjJEWHJsdkZRS2NMVXhxTmVRRDQ4eDBlSE95emp1bm1MTlFlai9pQ2tmb2N1?=
 =?utf-8?B?ZXlCTHJxZFBabC8yUlk5cGRhRlpzdlRKdGJ6ZWlrclRsNEJOMlVqbFp5TjBS?=
 =?utf-8?B?VnFyV1V0SERPZjJ1OFZWS3l0THVaZ0VnTFlKbWFUWm5nUWY3THVZc0VVb0Y0?=
 =?utf-8?B?QklXa3VtUGE4VG50Sm5vendNRDhVdEdIUUg0MCtLRmRGMUhmWkFRUUxMZ2JI?=
 =?utf-8?B?c3V0aUNhTnVVVlF1ZjRGRUhuNmQrdEo3VjFSRzZIOGNabDNrZ2VzRHlHVEs0?=
 =?utf-8?B?TFNUS1ZIZVZVbm5xWitOWXNDQ01QS3lZTnhtV0dKa05ueGh2WE1vdmRoSlZU?=
 =?utf-8?B?S3dYOE01N2kwWWkwQm5GV08wR1Zpa0ZPY2tVVVhPVFRtMUI3VHRUcUEvM2N6?=
 =?utf-8?B?dHpjbGQyc0lkY2l3bUcwbm0wRmQ3WUVzYzlQVkI3VWV6ZVlHMis4NUtjL1F1?=
 =?utf-8?B?VjBQWXgxL0pxNUt5SzdKVmFIZFZtYmErVEsrZ2NZUmNLZnM1UTR6MHF4WTQx?=
 =?utf-8?B?OFdxeDZSY0F4ano3RE9yUjZybTN2b2hkV0xjVFI0Y2ErQlBvZDNJVzhUMFdh?=
 =?utf-8?B?Tjd4QmMwb0R5a0VOMlp3bDh6ZjY5RmFPd2UxVDI4NUE0K2dUdk1XZ3FsbHJt?=
 =?utf-8?B?eWd6SUEzcmJUdGcva2N2OHBRbk1OVnI4QTlocUx0OExRK25idnFXemN6dExO?=
 =?utf-8?B?U1VrdVVyMmlkbUFUMnBlQWduNG5xREgwbFRnZ3M4SURwM0swK2tFNVFscUh4?=
 =?utf-8?B?RW04bzNnRy92RWtkUnRlank5TlN3amJBcm82RXRXem9rdzE3NW10aUNWT3N0?=
 =?utf-8?B?MEhzT1kzeVBSdysrMUlNRjc2L1A2Q2Z1NHF0cVQwNTd5bG9EZDNxVHBhcGQ4?=
 =?utf-8?B?a3N5d3NUZGtCMklPNlRJWGt0RGRFYWNuYlJnVnpheTVLbWloa2dZbDNWbE5p?=
 =?utf-8?B?T1Z3VjJDOC9BOG52SXZ4UnRSanRNUHZ5cmRMUjdmT3JvTDZkZ0tJZCtoNW4r?=
 =?utf-8?B?MU90TkZzZWJmREs3amFKZmJSb05zQ0s0cmRURjErWWdFUzVEZ0U3Q2t2QmdU?=
 =?utf-8?B?TWpoQXBBaGdQdXdlcVVIbnpDeGY2MDBHaEdpbTNnWHZaQ2o1QVVmcGMvc2p0?=
 =?utf-8?Q?otvw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WFFXRWZWbHVUZWJBZHc3ZG5UVUlGYmtNc3hwNHJzODc3NE9KU1EwQW82NXJh?=
 =?utf-8?B?WE9hc0YzbWtHZXJvTXZDa0x2ajR6MlpsMUt0RHVJUUxVR21lckoyRGVTWmdO?=
 =?utf-8?B?MkVCRjhpcnhWNi80RU5MZ2RSanpnMFdPc3pDM2huRzg5ekowOExOMnJTb1FB?=
 =?utf-8?B?bDBzU3lCeFVoZVlOQzNZR3F0U0Z6Nk9udEFGeDJkWTVCWjZUV3MycE84bHRw?=
 =?utf-8?B?VVhFT1hUeit3R096Sm9ZV3ZNclN3a2Q2QzNFdFZNRGtPdU9ud2xmZ2ZCWENa?=
 =?utf-8?B?T0xBUE5ldU1DQm9wTmIwK1hOZkNYMWhVYlViaGNveVNIWHl3c2lZaVB6THNF?=
 =?utf-8?B?bXpEMUpsNzNtWlNzN3JaU1ZMOEhMSTBKUlBmMVZwbVg4Vks5dVhxaEZYcVl6?=
 =?utf-8?B?WU5IYXhScHMwUVJaUGt0bXNqTTRDT256d1ByeTBDWEp3bmgzWWVUNVB5blhK?=
 =?utf-8?B?UW5aZTI4T2IvTmxGV29sa254d1c5K1dXQllZZFcrbkEzSmxWVnRoZy9SZVpm?=
 =?utf-8?B?NC9JRVU0NjRaaEZ2QVplL0J2U0JkazhUQ1R1NHgrQ05QN2Uvck9KTlAwam44?=
 =?utf-8?B?S212ZjlLeUZwbXhXUjZyN2R3aGtMeUFPd056d1ZaNTFNS1J4dlBMQTkzb1Jp?=
 =?utf-8?B?Ym9TY2FtdDNvYjUzeUs4QkhXanZLdFpVa3Fnd2tmbW55Zy9FM21vRFFaMHJm?=
 =?utf-8?B?L3ZTNk41TSsvYzRDRkVUQ3M3anFpZHg3TWY0QkplamJEM1I5czhjQ2w5Snky?=
 =?utf-8?B?ejRYRVZuMk9MbVdxSHJwbVlmdmlOb2FTcEhQVnArdk5EY3oyUGZyVGp3ZStp?=
 =?utf-8?B?WTJRSTlNTzh5c0htK240VHl1REJCY1lWcHczNm1jcEgwZE05RzBpc3VjSVJQ?=
 =?utf-8?B?aThKQVRVK2tRT3FiWHVmLzRrMDBXWU9pdFlSNTR1ZDErOHBGTDJpNTRlZXla?=
 =?utf-8?B?MzU3SzcyZ2dHSStGbVpZNmk0akJMeEFyK2hrTTArKytqNHVSNHB3WDNKZld0?=
 =?utf-8?B?Vy9MZlp3REp5MTloNkFsVlpMalN6bkwwWGtWZHF5cG5jampMeHlEaW1XYUVr?=
 =?utf-8?B?bEhuODFybDZ5dlhEdk9nbmM1enVhMjJ0bE0yTTJiY0JwaXJ2elhzWS9YM3Q1?=
 =?utf-8?B?OTBRemRXQXQxNjVORUlNK0dHZmNTVEk2VEJ3VlRuQWZ5N3dXTHdoNTdoVFRj?=
 =?utf-8?B?dnFUZ0xwbGR5VXN4cm9iN3RWeE1qTVlsMThITS91WGhPVGhsVGh5QkJBc0hE?=
 =?utf-8?B?RWFzS25JblFZUEUxdXlvTEtQVGcvWTRFanBNeWVOMWZpZ2I3ZXgyZko0U2lF?=
 =?utf-8?B?SmFBdmhJdmxTN245SjM4bDJsSFUzMGZ6Y1B4Z1Fqa01vdlRsQkdMTi8vTFVZ?=
 =?utf-8?B?S3BtaFVlbkcrTlpNTDJKVkd4TTRFNk1nd2NKTWpsSXR3OEhBTmRTYW4vdkxa?=
 =?utf-8?B?dGJFUW93ak5XZnd1WWFhMGJvcHgwbzFVRUp0UVQ2SzlTTVFEVG9YWXNEVW5x?=
 =?utf-8?B?bEtEdVlWTk9qRU4rWFNocEVwZlNJaytnOTFjSTlzWXdUaEJwdlptYnlOYUpF?=
 =?utf-8?B?NmhubjI1d08vd3hKVHBFRUhyeU1Vcy9XQmZKSUpiWEQ4VytabEJOQ0xmZE1P?=
 =?utf-8?B?bFV6eTVwbHpCVlhzSXYramk1RnNoS0d1cVBhQUpCMWVaamU5d21FZThLVHR3?=
 =?utf-8?B?UFNmWE1Uc1I0NEdiVEg1Q0hmZG03dk0zWEhib1ZWdDFSVzQ0NWFQQnY0VmlS?=
 =?utf-8?B?QjVCUlY3M0crZmtIdlNDZ0poYzhzaEQ1RzNhMXMzU09BNnk4L3hoL0s3QVYx?=
 =?utf-8?B?YThneTZqRXRGYnBLS1psMGh2SWNaQTc1aHdIYkhYdzhkR2grQVozQWxKV3A2?=
 =?utf-8?B?UzYvWEZ3THk0ZHVLSyt1VXRFSGh0RlN3MXRpVXhxUnYwUDlXT3ZBLy9VS0lD?=
 =?utf-8?B?R01FSnU3a2pDY0htSmtaSDI4amRiM1VCY3BTUDF1R3ZHQnltN2wvVnN2R2oz?=
 =?utf-8?B?TXU5SWpFTU9oQnloNGJOTGpIMER1cWJ2cnFNMmlydFI0YXJnOURXTWJQUk5s?=
 =?utf-8?B?VEIvQURpa2Z0ZFkxeHRDS091eFp4OGJCSkRBbGJCRFRjcWZ5ajZTN2dMaWZz?=
 =?utf-8?B?YVNDQndMTnREd1lRSlJESk5MbGF6NXErd3ZxS2xhdlMxcGxkMGc2d0I4NXdp?=
 =?utf-8?B?QUR2VVg2c0NYMS9KZHc3ejJNUGIxVVNrVFoxWlJZYnJYS0E3T0gvd0lIKzZM?=
 =?utf-8?B?bFE1WWdsN1lpemVTU2FydlBHQjVsY3BZUVVDSlZpRStnUXpUcWp6Uytvbmw2?=
 =?utf-8?B?cUlDaXdzWUd0ZitreTE2TVBNVGdUazEzZ0Naa1FFb29sdW5aeFF0Rm51VkZw?=
 =?utf-8?Q?1xjJtz95BekBAXTgZq8qB1m62v3Hphspywl0v?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: dd8e303f-fa9b-4dfc-5eb0-08de5e7c802a
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 14:49:55.3386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3dpEFzk417lWjbe34XrSrpIu2hWQMuxv080oqBw7Y2w5d2Tg8Ijkbn6x6lDw+P7eXanwMACUl3pKptrexEAhNr4x+QdMIXj8RWG93zX4u5E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11600
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 28 Jan 2026 14:50:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8774

Hi Antonin,

On 1/27/26 9:19 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Refresh the document now that the Poky repository is obsolete.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/system-requirements.rst | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
> index a56e683ca..9b681290e 100644
> --- a/documentation/ref-manual/system-requirements.rst
> +++ b/documentation/ref-manual/system-requirements.rst
> @@ -405,8 +405,8 @@ installer and automatically installs the tools for you:
>   
>   #. Execute the ``install-buildtools`` script. Here is an example::
>   
> -      $ cd poky
> -      $ scripts/install-buildtools \
> +      $ cd /path/to/bitbake-builds
> +      $ ./layers/openembedded-core/scripts/install-buildtools \
>           --without-extended-buildtools \
>           --base-url &YOCTO_DL_URL;/releases/yocto \
>           --release yocto-&DISTRO; \
> @@ -420,26 +420,26 @@ installer and automatically installs the tools for you:
>      To avoid the need of ``sudo`` privileges, the ``install-buildtools``
>      script will by default tell the installer to install in::
>   
> -      /path/to/poky/buildtools
> +      /path/to/bitbake-builds/buildtools
>   
>      If your host development system needs the additional tools provided
>      in the :term:`buildtools-extended` tarball, you can instead execute the
>      ``install-buildtools`` script with the default parameters::
>   
> -      $ cd poky
> +      $ cd /path/to/bitbake-builds
>         $ scripts/install-buildtools
>   

This doesn't exist. With bitbake-setup, I get:

poky-master/layers/oe-scripts/install-buildtools
poky-master/layers/oe-init-build-env-dir/scripts/install-buildtools
poky-master/layers/openembedded-core/scripts/install-buildtools

the first two are symlinks to the last one, so I assume we want

./layers/openembedded-core/scripts/install-buildtools

>      Alternatively if your host development system has a broken ``make``
>      version such that you only need a known good version of ``make``,
>      you can use the ``--make-only`` option::
>   
> -      $ cd poky
> +      $ cd /path/to/bitbake-builds
>         $ scripts/install-buildtools --make-only

Ditto.

With those fixed:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

