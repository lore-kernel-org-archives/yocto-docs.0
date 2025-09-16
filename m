Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9FA8CAC598
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 10:39:54 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.65])
 by mx.groups.io with SMTP id smtpd.web10.15980.1758019192777606185
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Sep 2025 03:39:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=Morau2u/;
 spf=pass (domain: siemens.com, ip: 40.107.159.65, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OqFVjLxdscNE6iUlcmy/CCMzfA0NJg6uo6XFCX2WAOFktLlhpQAm6+1xGhgzRdQKvyCM1THOGCvPbfPM899xN0iebF6LBHSAVah7SimkeBEvuhjaU5u6H7Vaqx9j08LZ1nkdqHFX9GhoyHF1bgfMYm+5VLFaLqrkIjq1Ql55YFXO3wbHMhrZuBzZNsa5/foFJdDiQKkWevFR0v1IK/YFYAYgg0XNjGQ/PmxArKOceV9upCmFpGqQ/Cefe0sejamTmXhXGnqMY0gIOn4q5ceD8uBD9j836a/Fa/tUZIx3eyvmJYpZc1nCoGMRxhWclWKlFcqcmRo9JVvOqaTyUlm9zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=62wlVbZrbVVFbKjJjS3R6Jh1oFhPxfu8WF991j76ZC4=;
 b=eHwY/LZpDsvE0rbTYhsAqOparI08Nl/FOH6HUJp0TR3J/CgifHjInOcDHMo4cfNkg4LantclmokJzTP3676mS4gxMZXaKwyZu4abxqJmTsmi1HivIpZ9urmn8FwQcg2yRk4ns1zAF4tvL59A40vtTmIkoh5faLTlHftUp8zUot3VLvUmVOtzHeH+0CuTlTrU5r+jQfoi4odO6ZEwk6A2sAeJBWi31Sfnjp1LJ8kI5JhFL8B+SShyjJ0CZ9nVX/u5SK3XCvyIIPT7Qmzp2aZLHxfbLjhnO80facq3W0aP+ZssZ5T5dp6TXTQ/G1zO9ocLk0C1vvB5ogeu+qgbGdergQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=62wlVbZrbVVFbKjJjS3R6Jh1oFhPxfu8WF991j76ZC4=;
 b=Morau2u/sgmRVNPru3P3d9eNR4+uhVBbLPAY8NjbnGgoNPkIFy3Ubk44aqbEfmHlXvx/q22TPEb7u2AOSPWZfFLBe0dg6QYBkukURlZxDLbRU/TV1j6q6ljZFowY5KZC6aBuiOPTsAdMnXM48CWAAtRgbhShy25AwHmXiNolOpoPkEnapPhqfxfp7vh6sp4L+CEPhUpZtXM5/mhRm2bdKBsgueAnKRmdZpM+gZQuX4cC8Tr0jm8sjLS7LlG1KBev9ZwXw6l0qLFgUNRu7bL0Ka21FmnNXcIFro4cSLQd4g3yBzgST+6C6txK2W2uVLX5UWX/W7rvsWkBzlfQvfdyVA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB4PR10MB6118.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:38d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 10:39:49 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9115.018; Tue, 16 Sep 2025
 10:39:48 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Quentin Schulz <quentin.schulz@cherry.de>, "docs@lists.yoctoproject.org"
	<docs@lists.yoctoproject.org>
Subject: RE: [docs] [PATCH] vulnerabilities: update nvdcve file name
Thread-Topic: [docs] [PATCH] vulnerabilities: update nvdcve file name
Thread-Index: AQHcFQbwHCuak5TkC0K19talfkv/abR+Ia0AgBegeMA=
Date: Tue, 16 Sep 2025 10:39:48 +0000
Message-ID: 
 <AS1PR10MB569701155DB1D9EDD00A2C2BFD14A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250824145316.1098911-1-peter.marko@siemens.com>
 <44868213-2ff2-44bf-89a6-48e1dc6d3b80@cherry.de>
In-Reply-To: <44868213-2ff2-44bf-89a6-48e1dc6d3b80@cherry.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=6603b651-166c-4873-a3f9-16b524da3f00;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-09-16T10:38:54Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB4PR10MB6118:EE_
x-ms-office365-filtering-correlation-id: a3023526-0c83-404d-3cc5-08ddf50d5c58
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?M0VyNlBsVERTR1gxcGtQU3hDd3JpVE9Gd3Q1eGNSNGF2aVRjVzlZcTgwT3ly?=
 =?utf-8?B?Qy9hUlhhSllNSjQyVkFMOU9ZWGg5NlJocW90QjkxWXhILy90MnpCTnRkaDFK?=
 =?utf-8?B?MmczNTR2cVpTMXVXdTlkcThtNjU4NHl1Y3ZuQ0Y1UHMrODRiaDlIb0N2dG1G?=
 =?utf-8?B?UEZSVXNBV2h3RjRmNVpCWEUyK1c5NUJ5NXhCRGFUckE3RVo2MDg0TmwveVVN?=
 =?utf-8?B?dUVhaWYvcUJWQzJZWm1QcGNrME0wQkM4K2JUd0c3VVhQWVpxMUFGOWtYZzRv?=
 =?utf-8?B?WTJ6ckxFVGR5QmtqLzZBbVg0M3lZMDBIY0R2bkVBY20rb3hkQlpJYktrTUtP?=
 =?utf-8?B?QkxIU3o4c2UzQ24ybU1YemtOQmV1cUhRY3liRXY4cHRjbURLS2VvTlNWaWtj?=
 =?utf-8?B?cU5Ydm5SaStVaHpKQTdXQjM0UnlXdndvWWhIMVhCTFZ0ek5VTVFVeWZ1RHRI?=
 =?utf-8?B?cWVRaGJNVDRtTnZWWnVTVjF0dzExM21tK3JWZlRVK2hzSUhwckVaa3lZQ3VJ?=
 =?utf-8?B?RXZrUFNZZXpTR1VWY01wL2xUblhMN3VUMVF6cWQ5WXlwakdnVlRBdjMrZVlx?=
 =?utf-8?B?YWFNWmtRbzMrSFgyTVpGUGRxTkh1ZkFUUU9EMUtCNlRManN5TUZsT1VwMjA2?=
 =?utf-8?B?SDBnT2krdHJFUmZxRzJOa3JQYVNqdDNQSlBjL1c1cUIzUkdWSTdJdDRnTXpw?=
 =?utf-8?B?ZWhxQk5xVVFwT05BMld0T1UvSEl5QUdaNzdCOEswZVRVbFJDYzVNc3Fzdng0?=
 =?utf-8?B?cnErWDlCTWxNc3ZxSTdXZEtTYnNWcUpFSVFpdnhjNmYxOWZQOEdML3R5NDRH?=
 =?utf-8?B?RHFFckw4SmpicFp4aWRvcGdQMTdCSEE4anBCcEN6QkNVR09PN1R0NVdhNUtL?=
 =?utf-8?B?c25iSXowZjFiQTNpeWdRWVVVNWIvSnY3ai9nNXJoWUNJYTZTeDA3TjZZbHY0?=
 =?utf-8?B?VElNUVJld1lpRS83dVcxOHJiMTFBV0xCNlJ5R2FQdXZNZ1NUQ3p0VFhPVUtj?=
 =?utf-8?B?WFgwR3FQSHd0TXV0bUU5SUpmb05OOTM5OTFsSHNGaDM4Q0QrQThHOTltdzVn?=
 =?utf-8?B?KytmRHVTTjFJbHNaL2RkY3B5ZzRkY29TQ05QQWxZUFFBaGpzU00va2ZTN1JT?=
 =?utf-8?B?TEFkQUxtNjZ4ckZkVUY5Um5zWTZFbjNzR3VQVmRxTk1tQ1J2emZaWEdKOUZY?=
 =?utf-8?B?SkNuNSsyNktTZC9taHpwVjJPZllOayt3SG9KcXhySk1DQWxoTkUzUnR2UHN6?=
 =?utf-8?B?TGVBRXVCdC9FV2xlYnhLL2I5SkpIZzM1eE53N1JlSXY0Z3FEUlRYcE5JY3pP?=
 =?utf-8?B?TUdLWm9EdklFR1RxOUNlSGZqTGNycEtpTnRDNEJ4T2MwYzlLYjJ6bWhWMHB3?=
 =?utf-8?B?RXBKcVJTMGx1QVB6RHlpMThSaU1pUDIreU1SM3RLZEZUaVA3U1hLSWJNK01j?=
 =?utf-8?B?NUd3N1VQNDczNmdIc2lheDZtcHJjRGZrNmlaaFdEOGd1dHAwZGxkdmNkdzhO?=
 =?utf-8?B?L0F2U3ZjZVpHeklmTk1HTHpLMHBHeW5DVUg2OTFIOVB3dkcxRUZBT1pUY0pF?=
 =?utf-8?B?blRQY0VMaGs0TE9HVk5HQk5wUDFaNVk4VHplcG1RYkY1M01BMEVtRTdES043?=
 =?utf-8?B?Q0w0U0oxWGJHZFpXVkFFa1FNRDRwQjE5WFhKT1h1M0hkUHpaaG1GQXlFbEY5?=
 =?utf-8?B?d2puYUttcDFneGNmQUlNSGVXUDFzcGNzMC9WRDdoNjdrWFVMN3VOOEdxR05k?=
 =?utf-8?B?Mng1MDQ1MUtGVkgvVU12d01kV1hjTzJZR2RBSEdjaDJwVjB3UmtRa2NGN24r?=
 =?utf-8?B?Zi9ZUE82eENGZXR1YjNDTnBmcVF2K0xJMlAxVkh1d2UzTjZHOWEycWYxT0M3?=
 =?utf-8?B?MnV5bFdUWFJmMVkvQzdYaWJ1QS9qZnk4Y3d2TTB6OC9kK25adHBDSXJmeFJp?=
 =?utf-8?B?d3l2akYrcS9IYmdkUDU5T2pZNjhMbzM2aGgzMXVKL1UraHZVZGhraUN0NkRJ?=
 =?utf-8?B?UzFwa0xPVklRPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ci9XTVhJNEVuTjV4ZUs5c0NQYUlyakVGTm1MekhldmhmRDFZMXp6b2pualJO?=
 =?utf-8?B?K3pIdDY5MisreVZwUE1TQlIrNzA4Sk00NTZkTWt2NEpnUlVLdmdZVHB5YnFE?=
 =?utf-8?B?SGJBcXRRcW1iQkVDTkxnRi8vK2FrRDlCTjZFd1Y5ZEp3UmpXSFQ1NWxaYnhS?=
 =?utf-8?B?bkRFeHg2eWRTak1ORytsOUtOSjg4SU1vL1dzY2g5ZitBQmNuTkt0elFYaXdL?=
 =?utf-8?B?dmkxSDRKQ0h3ZnlTb1EwcDY4VksvNVUwWWcvVGlLSHZDMnFreVBOdE9JMDcy?=
 =?utf-8?B?YkExYU5mRW54UUxtOE5KUFl2U3o4Nm1Db3hEYzlFRExQRjZkV0ZPVHBCQUpQ?=
 =?utf-8?B?bWxRZkJuZDdQdzhaMktrdGpqUTR1NUJXRVVaLzJWYWFVbWs0YjMvZ2lUYW9O?=
 =?utf-8?B?Y1hDU2dMNlluYkJUOEFzK2d0ekJ1R05ObkNHNVBnVUljbm5mNnpCREl0Wkp2?=
 =?utf-8?B?QmVwUE1kZEZyMWtLY3NyZmdoaEw3VUNOdmsrZmx4MlZxb3RjWHh0VElKcHR0?=
 =?utf-8?B?Wjl1YVVUMW1EK1N2ZWJPZEZTY1hTRlA4WUpDeEwveHRDQ3k2T2VQeC9ROW5N?=
 =?utf-8?B?bWdJSUJJTmxzalVpTm5aZ0ViTUlSblN5amhQNUVwMHpyaTFXb2JMN0FMRjl4?=
 =?utf-8?B?WmxXZmZQR05YSHFURWdaZEViMkFtTFVxS2h6Z2s3WHNDeFluRWNCcHIvMjRN?=
 =?utf-8?B?emhwN0FnZWZhSkdkU3Q1NmZWZkNTa3VzUGNXaEF3bUNGbmZBZnBzdGZEVnNP?=
 =?utf-8?B?bEl1U2ZReFJtUUNsRXFrZWJUc1FtSHhLeHZWYXU0SjJ6SEFaNTFUT2tUcEFo?=
 =?utf-8?B?MU5malYzeTRId1BNaWRUWmNWMjBsdWZweUIvWVNzcVI4OFJvd1pEUVBhcVVD?=
 =?utf-8?B?SGZpWCsreVpoZHVzNVczV0RsUlVnUklnVHRFRWRzNU5FdU83MlBvZXNGZUYr?=
 =?utf-8?B?R3UrdlVUZkV3dXluRW5MSzROOEJHN0pQYld4UUFZblpZQ0FkeEdaMm1QWlgw?=
 =?utf-8?B?WUlrYjlXaTZuSVE5aUdnNG9xd2lLYkptdWRqYTVRbXVjSEZkWVlBNWVJNTZ3?=
 =?utf-8?B?L3pkUnVRa1NlY1hCaVRVTlRJdmJTN0c4UWROeEVPQ29DMVR2b0NiSFN4QlFt?=
 =?utf-8?B?VUxncjV0WTNiTnBJM1g1d1B2OGRNVFNTdDVhaDVpeDM3dlFYRFgxWHpmZjF5?=
 =?utf-8?B?Vy96TXZLV0VEYVc2QVVDdkUzQ1h1cm5ueG5uV0lPeFRqSDgvWUVpNEc0Q01D?=
 =?utf-8?B?U2xKUUk2eVlEeHBlZFgzL0ZMZ3ZIY2pIakkyOFlpcXp3R0JHcFRYdHowcjd1?=
 =?utf-8?B?Z0dMTTZWeEJ2aHdWaUp4SHFIV2hJVFhBVzk1RjdGWEpMSzB3VU9lZ3NFekxj?=
 =?utf-8?B?ODZUU1BZME5seWI1N2M1a0p1QlZLRDJub3BMQTh0amN5c1NwTzZ6YlJnb2Mw?=
 =?utf-8?B?S3REQUdDRUNrcDZURDVZZXAvM0hwY3RNcG9wdHd1a0dTc1BwK0lYSzkrTDFK?=
 =?utf-8?B?N216SUNPbmpXc0k5a2RhcVo3Y1NLMW8xVFRMYlY0TmZsYWpwN2JoazhoNDZq?=
 =?utf-8?B?aU91VjZyREpiMWJYcXV6d3hlbXpIaFVGOXBBQThiTG85Vm1OK1Uyd3BwQ2o5?=
 =?utf-8?B?MUpoakx1eFVXZnVGUFRsa0VhNW9LOXRlUWY1SXQwV0Y5V0RHT3FESVpXZDRl?=
 =?utf-8?B?dm90RHdqck5LWUQzOCtta2kxZWtObmpuUXQ5TnlHTVFDbmdRMzZ2SUZNWkNU?=
 =?utf-8?B?MTFLU2l1aENUMi8zbEc4RnY4N09MT3FUZ3RaVHJYR0d6bHZVSTZaNGJVMnVX?=
 =?utf-8?B?L3ltS05SUUFKaDcvME1yTEpiSUNBQVBjU1RDWmNJWmlYZnd0U0wrSDB2UlZp?=
 =?utf-8?B?Uk5tS1BYRGIrdU1XakhNT0llQy9ubGQyL2hGLytMWk1jZVFiVTJ1bTBHYnRJ?=
 =?utf-8?B?cC9LRU1DUlZ5K2JEZmFQTU1EbzExdCtwamp6YXc3L1k0Zkphb0NxNDVYc0xO?=
 =?utf-8?B?MzJiU1d0L0Yzb2Q3aGY4ckNzTnhOU2JtN2REZ0FLU0RjMkFobjNuZFhKcDdJ?=
 =?utf-8?B?RkN0amdWNm9CN0ZVV0JRMVduSWZ2UU9NQmpmZS85cHpPdXBaS0tTYnhCcVF1?=
 =?utf-8?Q?cRvsG8jbBBxREW6bN90KCaqln?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a3023526-0c83-404d-3cc5-08ddf50d5c58
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2025 10:39:48.9092
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q4PVWVweRLxGKxehzlm0fJcM8BZpCgIlvesbXHiuOU5DNTG1jsOFgca2k3LK8WpL1r02RT1XqEAV6/UdrcCFLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB6118
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Sep 2025 10:39:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7522

SGVsbG8sDQoNCkkganVzdCB3YW50ZWQgdG8gc2F5IHRoYXQgSSdtIGJhY2sgZnJvbSB2YWNhdGlv
biBhbmQgd2lsbCB0cnkgdG8gc3VibWl0IHBhdGNoZXMgZm9yIExUUyBicmFuY2hlcyBzdGlsbCB0
aGlzIHdlZWsuDQoNClBldGVyDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogUXVlbnRpbiBTY2h1bHogPHF1ZW50aW4uc2NodWx6QGNoZXJyeS5kZT4NCj4gU2VudDogTW9u
ZGF5LCBTZXB0ZW1iZXIgMSwgMjAyNSAxMTo1MQ0KPiBUbzogTWFya28sIFBldGVyIChGVCBEIEVV
IFNLIEJGUzEpIDxQZXRlci5NYXJrb0BzaWVtZW5zLmNvbT47DQo+IGRvY3NAbGlzdHMueW9jdG9w
cm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW2RvY3NdIFtQQVRDSF0gdnVsbmVyYWJpbGl0aWVz
OiB1cGRhdGUgbnZkY3ZlIGZpbGUgbmFtZQ0KPiANCj4gSGkgUGV0ZXIsDQo+IA0KPiBPbiA4LzI0
LzI1IDQ6NTMgUE0sIFBldGVyIE1hcmtvIHZpYSBsaXN0cy55b2N0b3Byb2plY3Qub3JnIHdyb3Rl
Og0KPiA+IEZyb206IFBldGVyIE1hcmtvIDxwZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4NCj4gPg0K
PiA+IFRoZSBmaWxlbmFtZSBpcyBvdXRkYXRlZCBhcyBpdHMgdmVyc2lvbiB3YXMgYWxyZWFkeSBi
dW1wZWQgYW5kIHRoZXJlIGFyZQ0KPiA+IGFsc28gZGlmZmVyZW50IGZpbGVzIGZvciBkaWZmZXJl
bnQgZmVlZCBjaG9pY2VzLg0KPiA+IFVzZSBnbG9iIHRvIG1hdGNoIGFueSBhdmFpbGFibGUgZmls
ZS4NCj4gPg0KPiANCj4gV2hlbiBkaWQgdGhpcyBiZWNvbWUgcG9zc2libGU/IEkgc2VlIGEgbmV3
IGZldGNoZXIgaW4NCj4gZmI2MmM0YzNkYmNhNGU1OGY3Y2U2Y2YyOWQ0YjYzMGEwNjQxMWE5NyAo
ImN2ZS11cGRhdGUtbnZkMi1uYXRpdmU6IG5ldw0KPiBDVkUgZGF0YWJhc2UgZmV0Y2hlciIpIHdo
aWNoIGlzIGFscmVhZHkgaW4gbWlja2xlZG9yZSBzbyB3b3VsZCBiZSBhDQo+IGNhbmRpZGF0ZSBm
b3IgYmFja3BvcnRpbmcgdG8gd2FsbmFzY2FyIGFuZCBzY2FydGhnYXAuDQo+IA0KPiA+IEFsc28g
dGhlIGRpcmVjdG9yeSBjaGFuZ2VkIHRvIENWRV9DSEVDSzIgbWVhbndoaWxlLCBzbyBVcGRhdGUg
aXQsIHRvby4NCj4gPg0KPiANCj4gVGhpcyBjaGFuZ2VkIGluIGRkMjQ5OTIxYTVkNmI4ZTQ3MjI0
MmI1NzQxNWRlM2YyMTBkYzgxZjENCj4gKCJjdmUtdXBkYXRlLWRiLW5hdGl2ZTogdXBkYXRlIHN0
cnVjdHVyZSIpIGFwcGFyZW50bHksIHdoaWNoIGlzIHBhcnQgb2YNCj4gd2FsbmFzY2FyIHNvIHdv
dWxkIGJlIGEgY2FuZGlkYXRlIGZvciBiYWNrcG9ydCB0byB3YWxuYXNjYXIuDQo+IA0KPiBJIHRo
aW5rIHNlcGFyYXRlIGNvbW1pdHMgd291bGQgYmUgbmljZSBzbyB3ZSBjYW4gYmFja3BvcnQgdGhl
IGdsb2IgdG8NCj4gc2NhcnRoZ2FwIHRvbyBhbmQgaGF2ZSB0aGUgQ1ZFX0NIRUNLMiBiYWNrcG9y
dGVkIHRvIHdhbG5hc2NhciBvbmx5Lg0KPiANCj4gQ2hlZXJzLA0KPiBRdWVudGluDQo=

